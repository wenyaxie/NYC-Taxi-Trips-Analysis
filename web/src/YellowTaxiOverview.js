import * as React from "react";
import { Spin } from "antd";
import { Column } from '@antv/g2plot';

class YellowTaxiOverview extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/yellow-taxi-overview')
            .then((res) => res.json())
            .then((data) => {
                this.setState({ loading: false });
                const column = new Column('yellow-taxi-overview', {
                    data,
                    xField: 'year',
                    yField: 'trips',
                    smooth: true,
                    animation: {
                        appear: {
                            animation: 'path-in',
                            duration: 1000,
                        }
                    }
                });
                column.render();
            });
    }

    render() {
        return <div id="yellow-taxi-overview" style={{ textAlign: 'center' }}>
            {this.state.loading && <Spin size='large' style={{ paddingTop: '100px' }} />}
        </div>;
    }
}

export default YellowTaxiOverview;