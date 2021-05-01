import * as React from "react";
import { Spin } from "antd";
import { DualAxes } from '@antv/g2plot';


class TripsRelationshipWithCovid extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/trips-relationship-with-covid-cases')
            .then((res) => res.json())
            .then((data) => {
                const tripData = [];
                const covidData = [];
                for (const item of data) {
                    tripData.push({
                        month: item['month'],
                        trips: item['tripcount'],
                        name: 'Trips'
                    });
                    covidData.push({
                        month: item['month'],
                        count: item['confirmed'],
                        name: 'Confirmed'
                    });
                    covidData.push({
                        month: item['month'],
                        count: item['death'],
                        name: 'Death'
                    });
                }

                console.log(covidData);

                this.setState({ loading: false });
                const dualaxes = new DualAxes('trips-relationship-with-covid-cases', {
                    data: [tripData, covidData],
                    xField: 'month',
                    yField: ['trips', 'count',],
                    smooth: true,
                    geometryOptions: [
                        {
                            geometry: 'column',
                            seriesField: 'trips',
                            columnWidthRatio: 0.4,
                        },
                        {
                            geometry: 'line',
                            seriesField: 'name',
                            lineStyle: ({ name }) => {
                                if (name === 'Confirmed') {
                                    return {
                                        lineDash: [1, 4],
                                        opacity: 1,
                                    };
                                }
                                return {
                                    opacity: 0.5,
                                };
                            },
                        },
                    ],
                    // animation: {
                    //     appear: {
                    //         animation: 'path-in',
                    //         duration: 1000,
                    //     }
                    // }
                });
                dualaxes.render();
            });
    }

    render() {
        return <div id="trips-relationship-with-covid-cases" style={{ textAlign: 'center' }}>
            {this.state.loading && <Spin size='large' style={{ paddingTop: '100px' }} />}
        </div>;
    }
}

export default TripsRelationshipWithCovid;