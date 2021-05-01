import React from "react";
import { Spin } from "antd";
import { Line } from '@antv/g2plot';

class PaymentMethodTrend extends React.Component {

    constructor(props) {
        super(props);
        this.state = { loading: true };
    }

    componentDidMount() {
        fetch('/payment-type-trend')
            .then((res) => res.json())
            .then((data) => {
                this.setState({ loading: false });
                const line = new Line('payment-type-trend', {
                    data,
                    padding: 'auto',
                    xField: 'year',
                    yField: 'num',
                    seriesField: 'payment_type',
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
        return <div id="payment-type-trend" style={{ textAlign: 'center' }}>
            {this.state.loading && <Spin size='large' style={{ paddingTop: '100px' }} />}
        </div>;
    }
}

export default PaymentMethodTrend;
