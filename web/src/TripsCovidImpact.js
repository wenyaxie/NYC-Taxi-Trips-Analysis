import * as React from "react";
import { Spin } from "antd";
import { Line } from '@antv/g2plot';

class TripsCovidImpact extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/trips-impact-due-to-covid')
            .then((res) => res.json())
            .then((data) => {
                this.setState({ loading: false });
                const line = new Line('trips-impact-due-to-covid', {
                    data,
                    xField: 'month',
                    yField: 'trips',
                    seriesField: 'year',
                    smooth: true,
                    animation: {
                        appear: {
                            animation: 'path-in',
                            duration: 1000,
                        }
                    }
                });
                line.render();
            });
    }

    render() {
        return <div id="trips-impact-due-to-covid" style={{ textAlign: 'center' }}>
            {this.state.loading && <Spin size='large' style={{ paddingTop: '100px' }} />}
        </div>;
    }
}

export default TripsCovidImpact;