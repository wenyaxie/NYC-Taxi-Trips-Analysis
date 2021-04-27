import google.oauth2.id_token
from google.auth.transport import requests
from flask import Flask, render_template, request
import datetime
from google.cloud import datastore

app = Flask(__name__,
            static_folder="web/build/static",
            template_folder="web/build")

datastore_client = datastore.Client()
firebase_request_adapter = requests.Request()


@app.route("/")
def root():
    return render_template('index.html')


@app.route("/test")
def test():
    print()
    # result = bigquery.read("sdf")
    # return result


# @app.route('/')
# def root():
#     # Verify Firebase auth.
#     id_token = request.cookies.get("token")
#     error_message = None
#     claims = None
#     times = None

#     if id_token:
#         try:
#             # Verify the token against the Firebase Auth API. This example
#             # verifies the token on each page load. For improved performance,
#             # some applications may wish to cache results in an encrypted
#             # session store (see for instance
#             # http://flask.pocoo.org/docs/1.0/quickstart/#sessions).
#             claims = google.oauth2.id_token.verify_firebase_token(
#                 id_token, firebase_request_adapter)
#             print(claims)
#         except ValueError as exc:
#             # This will be raised if the token is expired or any other
#             # verification checks fail.
#             error_message = str(exc)

#         # Record and fetch the recent times a logged-in user has accessed
#         # the site. This is currently shared amongst all users, but will be
#         # individualized in a following step.
#         store_time(datetime.datetime.now())
#         times = fetch_times(10)

#     return render_template(
#         'index.html',
#         user_data=claims, error_message=error_message, times=times)


# def store_time(dt):
#     entity = datastore.Entity(key=datastore_client.key('visit'))
#     entity.update({
#         'timestamp': dt
#     })

#     datastore_client.put(entity)


# def fetch_times(limit):
#     query = datastore_client.query(kind='visit')
#     query.order = ['-timestamp']

#     times = query.fetch(limit=limit)

#     return times


if __name__ == '__main__':
    # This is used when running locally only. When deploying to Google App
    # Engine, a webserver process such as Gunicorn will serve the app. This
    # can be configured by adding an `entrypoint` to app.yaml.
    # Flask's development server will automatically serve static files in
    # the "static" directory. See:
    # http://flask.pocoo.org/docs/1.0/quickstart/#static-files. Once deployed,
    # App Engine itself will serve those files as configured in app.yaml.
    app.run(host='127.0.0.1', port=8080, debug=True)
