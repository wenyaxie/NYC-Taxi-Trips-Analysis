from flask import Flask, jsonify, render_template, request
from google.cloud import bigquery

MONTHS = ['January', 'February', 'March', 'April', 'May', 'June',
          'July', 'August', 'September', 'October', 'November', 'December']

app = Flask(__name__,
            static_folder="web/build/static",
            template_folder="web/build")

bigquery_client = bigquery.Client()


@app.route("/")
def root():
    return render_template('index.html')


@app.route("/trips-by-week")
def summary_table():
    year = request.args.get('year')
    query = """
    SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
    FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
    WHERE pickup_year = {}
    GROUP BY pickup_weekday
    ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
    when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
    when pickup_weekday = 'Sunday' then '7' end);
    """.format(year)
    query_job = bigquery_client.query(query)
    rows = []
    for row in query_job.result():
        rows.append(row)
    return jsonify([
        {
            'week': row.get('Week'),
            'trip_number': row.get('Trip_Number')
        }
        for row in rows
    ])


@app.route("/trips-by-month")
def summary_table_2():
    year = request.args.get('year')
    query = """
    SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
    FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
    WHERE pickup_year = {}
    GROUP BY pickup_month
    ORDER BY pickup_month;
    """.format(year)
    query_job = bigquery_client.query(query)
    rows = []
    for row in query_job.result():
        rows.append(row)
    return jsonify([
        {
            'month': MONTHS[row.get('Month') - 1],
            'trip_number': row.get('Trip_Number')
        }
        for row in rows
    ])


@app.route("/passenger-count")
def summary_table_3():
    year = request.args.get('year')
    query = """
    SELECT Count(1) AS Count_in_year, pickup_month AS Month,
    CASE
        WHEN passenger_count < 6 THEN 'Legal'
        ELSE 'Illegal'
    END
    AS is_legal
    FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
    WHERE pickup_year = {} AND passenger_count < 11
    GROUP BY pickup_month, is_legal
    ORDER BY pickup_month;  
    """.format(year)
    query_job = bigquery_client.query(query)
    rows = []
    for row in query_job.result():
        rows.append(row)
    return jsonify([
        {
            'count': row.get('Count_in_year'),
            'month': MONTHS[row.get('Month')-1],
            'legal': row.get('is_legal')
        }
        for row in rows
    ])


@app.route("/payment-type-trend")
def payment_type_trend():
    query = """
        SELECT pickup_year, count( payment_type ) as number, payment_type FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` 
        WHERE payment_type = 'CSH' OR payment_type = 'CRD'
        group by payment_type, pickup_year
        ORDER BY pickup_year, payment_type;
    """
    query_job = bigquery_client.query(query)
    rows = []
    for row in query_job.result():
        rows.append(row)
    return jsonify([
        {
            'year': row.get('pickup_year'),
            'payment_type': row.get('payment_type'),
            'num': row.get('number')
        }
        for row in rows
    ])


@app.route("/change-of-tip-rates-from-2013-to-2020")
def change_of_tip_rates():
    query = """
        SELECT ROUND(AVG(tip_rate), 2) AS Tip_Rate, pickup_year
        FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
        WHERE pickup_year BETWEEN 2013 and 2020
        GROUP BY pickup_year
        ORDER BY pickup_year;
    """
    query_job = bigquery_client.query(query)
    rows = []
    for row in query_job.result():
        rows.append(row)
    return jsonify([
        {
            'year': row.get('pickup_year'),
            'tip_rate': row.get('Tip_Rate')
        }
        for row in rows
    ])


@app.route("/trips-impact-due-to-covid")
def covid_impact():
    query = """
        SELECT COUNT(*) trips, pickup_year, pickup_month
        FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
        WHERE pickup_year BETWEEN 2019 AND 2020
        GROUP BY pickup_year, pickup_month
        ORDER BY pickup_year, pickup_month;
    """
    query_job = bigquery_client.query(query)
    rows = []
    for row in query_job.result():
        rows.append(row)
    return jsonify([
        {
            'year': str(row.get('pickup_year')),
            'trips': row.get('trips'),
            'month': MONTHS[row.get('pickup_month') - 1]
        }
        for row in rows
    ])


@app.route("/trips-relationship-with-covid-cases")
def covid_impact_ii():
    query = """
        SELECT pickup_month as month ,COUNT(*) tripNum, IFNULL(confirmed_cases, 0) AS covid_confirmed_casesNum ,IFNULL(deaths_num, 0) AS covid_deathsNum
        FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
        left Join
            (SELECT extract(MONTH from date ) as pickup_month ,extract(YEAR from date) as pickup_year,max(confirmed_cases) as confirmed_cases, max(deaths) as deaths_num, 
            FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.covid19state_confirmed_cases`
            where state_name = 'New York' and date <= '2020-12-31'
            group by pickup_month,pickup_year ) using (pickup_month,pickup_year)

        WHERE pickup_year = 2020
        GROUP BY pickup_month,confirmed_cases,deaths_num
        ORDER BY pickup_month;
    """
    query_job = bigquery_client.query(query)
    rows = []
    for row in query_job.result():
        rows.append(row)
    return jsonify([
        {
            'month': MONTHS[row.get('month') - 1],
            'tripcount':row.get('tripNum'),
            'confirmed':row.get('covid_confirmed_casesNum'),
            'death':row.get('covid_deathsNum')
        }
        for row in rows
    ])


if __name__ == '__main__':
    # This is used when running locally only. When deploying to Google App
    # Engine, a webserver process such as Gunicorn will serve the app. This
    # can be configured by adding an `entrypoint` to app.yaml.
    # Flask's development server will automatically serve static files in
    # the "static" directory. See:
    # http://flask.pocoo.org/docs/1.0/quickstart/#static-files. Once deployed,
    # App Engine itself will serve those files as configured in app.yaml.
    app.run(host='127.0.0.1', port=8080, debug=True)
