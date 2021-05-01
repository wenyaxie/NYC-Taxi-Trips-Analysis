import React, { useState } from "react";
import { Button, Modal, Table } from 'antd';
import TripsByWeek from "./TripsByWeek";
import TripsByMonth from "./TripsByMonth";
import PassengerCount from "./PassengerCount";

function SummaryTable() {
    const [year, setYear] = useState(2013);
    const [graph, setGraph] = useState("");

    const startYear = 2013;
    const endYear = 2020;
    const dataSource = [];
    for (var i = startYear; i <= endYear; i++) {
        dataSource.push({ key: i, year: i });
    }

    return <>
        <Table
            dataSource={dataSource}
            columns={[
                { title: 'Year', dataIndex: 'year', key: 'year' },
                {
                    title: 'Trips by Week',
                    dataIndex: 'year',
                    key: 'trips-by-week',
                    render: year => <Button
                        onClick={() => { setYear(year); setGraph('Trips by Week') }}
                    >
                        View
                        </Button>,
                },
                {
                    title: 'Trips by Month',
                    dataIndex: 'year',
                    key: 'trips-by-month',
                    render: year => <Button
                        onClick={() => { setYear(year); setGraph('Trips by Month') }}
                    >
                        View
                        </Button>,
                },
                {
                    title: 'Legal vs Illegal Passenger Count',
                    dataIndex: 'year',
                    key: 'passenger-count',
                    render: year => <Button
                        onClick={() => { setYear(year); setGraph('Passenger Count') }}
                    >
                        View
                        </Button>,
                }
            ]}
            pagination={false}
        />
        <Modal
            title={`${graph} - ${year}`}
            width={1000}
            visible={graph}
            onOk={() => setGraph('')}
            onCancel={() => setGraph('')}
        >
            <div>
                {graph === 'Trips by Week' && <TripsByWeek year={year} />}
                {graph === 'Trips by Month' && <TripsByMonth year={year} />}
                {graph === 'Passenger Count' && <PassengerCount year={year} />}
            </div>
        </Modal>
    </>;
}

export default SummaryTable;