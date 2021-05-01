import React from "react";
import { Spin } from "antd";
import { Line } from '@antv/g2plot';

class TripsByMonth extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/trips-by-month?year=' + this.props.year)
            .then((res) => res.json())
            .then((data) => {
                this.setState({ loading: false });
                const line = new Line('trips-by-month', {
                    data,
                    padding: 'auto',
                    xField: 'month',
                    yField: 'trip_number',
                    smooth: true,
                    animation: {
                        appear: {
                            animation: 'path-in',
                            duration: 1000,
                        }
                    }
                });
                line.render();
                this.setState({ loading: false, line: line });
            });
    }

    componentDidUpdate(prevProps) {
        if (prevProps.year !== this.props.year) {
            this.setState({ loading: true, line: this.state.line });
            fetch('/trips-by-month?year=' + this.props.year)
                .then((res) => res.json())
                .then((data) => {
                    const line = this.state.line;
                    line.changeData(data);
                    this.setState({ loading: false, line: line });
                    line.render();
                });
        }
    }

    render() {
        return <>
            <div style={{ textAlign: 'center' }}>
                {this.state.loading && <Spin size='default' style={{ paddingTop: '10px' }} />}
            </div>
            <div id="trips-by-month" style={{ textAlign: 'center', height: '400px', display: this.state.loading ? 'none' : 'block' }} />
        </>;
    }
}

export default TripsByMonth;
