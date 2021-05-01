import React from "react";
import { Spin } from "antd";
import { Line } from '@antv/g2plot';

class TripsByWeek extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/trips-by-week?year=' + this.props.year)
            .then((res) => res.json())
            .then((data) => {
                this.setState({ loading: false });
                const line = new Line('trips-by-week', {
                    data,
                    padding: 'auto',
                    xField: 'week',
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
            fetch('/trips-by-week?year=' + this.props.year)
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
            <div id="trips-by-week" style={{ textAlign: 'center', height: '400px', display: this.state.loading ? 'none' : 'block' }} />
        </>;
    }
}

export default TripsByWeek;
