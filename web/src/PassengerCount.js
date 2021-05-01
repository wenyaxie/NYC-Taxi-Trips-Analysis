import React from "react";
import { Spin } from "antd";
import { Bar } from '@antv/g2plot';

class PassengerCount extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/passenger-count?year=' + this.props.year)
            .then((res) => res.json())
            .then((data) => {
                this.setState({ loading: false });
                const bar = new Bar('passenger-count', {
                    data,
                    padding: 'auto',
                    xField: 'count',
                    yField: 'month',
                    seriesField: 'legal',
                    smooth: true,
                    animation: {
                        appear: {
                            animation: 'path-in',
                            duration: 1000,
                        }
                    }
                });
                bar.render();
                this.setState({ loading: false, bar: bar });
            });
    }

    componentDidUpdate(prevProps) {
        if (prevProps.year !== this.props.year) {
            this.setState({ loading: true, bar: this.state.bar });
            fetch('/passenger-count?year=' + this.props.year)
                .then((res) => res.json())
                .then((data) => {
                    const bar = this.state.bar;
                    bar.changeData(data);
                    this.setState({ loading: false, bar: bar });
                    bar.render();
                });
        }
    }

    render() {
        return <>
            <div style={{ textAlign: 'center' }}>
                {this.state.loading && <Spin size='default' style={{ paddingTop: '10px' }} />}
            </div>
            <div id="passenger-count" style={{ textAlign: 'center', height: '400px', display: this.state.loading ? 'none' : 'block' }} />
        </>;
    }
}

export default PassengerCount;