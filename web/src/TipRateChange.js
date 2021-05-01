import * as React from "react";
import { Spin } from "antd";
import { Bar } from '@antv/g2plot';

class TipRateChange extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/change-of-tip-rates-from-2013-to-2020')
            .then((res) => res.json())
            .then((data) => {
                this.setState({ loading: false });
                const bar = new Bar('change-of-tip-rates-from-2013-to-2020', {
                    data,
                    xField: 'tip_rate',
                    yField: 'year',
                    seriesField: 'year'
                });
                bar.render();
            });
    }

    render() {
        return <div id="change-of-tip-rates-from-2013-to-2020" style={{ textAlign: 'center' }}>
            {this.state.loading && <Spin size='large' style={{ paddingTop: '100px' }} />}
        </div>;
    }
}

export default TipRateChange;