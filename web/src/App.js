import React, { useState } from 'react';
import { Alert, Avatar, Button, Dropdown, Layout, Menu } from 'antd';
import { DownOutlined } from '@ant-design/icons';
import firebase from "firebase/app";
import "firebase/auth";
import { FirebaseAuthConsumer, FirebaseAuthProvider } from "@react-firebase/auth";

import "./App.css";
import PaymentMethodTrend from "./PaymentMethodTrend.js";
import TipRateChange from "./TipRateChange.js"
import TripsCovidImpact from "./TripsCovidImpact.js"
import firebaseConfig from "./firebaseConfig"; // Config acquired from https://console.firebase.google.com/u/1/project/sjsu-nyc-taxi-trips-analysis/settings/general
import SummaryTable from './SummaryTable';
import TripsRelationshipWithCovid from './TripsRelationshipWithCovid.js'

const { Header, Content, Sider } = Layout;

function App() {
  const [option, setOption] = useState('SummaryTable');

  return (
    <FirebaseAuthProvider {...firebaseConfig} firebase={firebase}>
      <FirebaseAuthConsumer>
        {({ isSignedIn, user, providerId }) => (
          <Layout className="layout">
            <Header>
              <h1 style={{ color: 'white', margin: '0px', float: 'left' }}>
                NYC Taxi Trips Analysis
              </h1>
              {sjsuSignedIn(isSignedIn, user) && user.displayName &&
                <div style={{ paddingBottom: '5px', float: 'right', color: 'white' }}>
                  <Dropdown
                    overlay={
                      <Menu>
                        <Menu.Item onClick={() => { firebase.auth().signOut(); }}>
                          Logout
                        </Menu.Item>
                      </Menu>
                    }
                  >
                    <p>{user.displayName} <DownOutlined /></p>
                  </Dropdown>
                </div>
              }
              {sjsuSignedIn(isSignedIn, user) && user.photoURL &&
                <div style={{ paddingBottom: '5px', paddingRight: '5px', float: 'right' }}>
                  <Avatar src={user.photoURL} />
                </div>
              }
            </Header>
            <Layout style={{ minHeight: 800 }}>
              <Sider theme='dark' width={200}>
                <Menu defaultSelectedKeys={[option]}>
                  <Menu.Item key='SummaryTable' onClick={() => setOption('SummaryTable')}>
                    Summary Table
                  </Menu.Item>
                  <Menu.Item key='trips-impact-due-to-covid' onClick={() => setOption('trips-impact-due-to-covid')}>
                    Covid Impact I
                  </Menu.Item>
                  <Menu.Item key='trips-relationship-with-covid-cases' onClick={() => setOption('trips-relationship-with-covid-cases')}>
                    Covid Impact II
                  </Menu.Item>
                  <Menu.Item key='payment-method-trend' onClick={() => setOption('payment-method-trend')}>
                    Payment Type Trend
                  </Menu.Item>
                  <Menu.Item key='change-of-tip-rates-from-2013-to-2020' onClick={() => setOption('change-of-tip-rates-from-2013-to-2020')}>
                    Tips Rate Change
                  </Menu.Item>
                  <Menu.Item key='most-expensive-location' onClick={() => setOption('most-expensive-location')}>
                    Most Expensive Location
                  </Menu.Item>
                </Menu>
              </Sider>
              <Content>
                <div className="site-layout-content">
                  {isSignedIn && user && user.email && user.email.indexOf("@sjsu.edu") === -1 &&
                    <Alert
                      message={`You must login with your SJSU account, not ${user.email}!`}
                      type="error"
                      action={
                        <Button type="default" onClick={onClockLogin}>Login</Button>
                      }
                    />
                  }
                  {!isSignedIn && <Button type="default" onClick={onClockLogin}>Login with SJSU Account</Button>}
                  {sjsuSignedIn(isSignedIn, user) && option === 'SummaryTable' &&
                    < SummaryTable />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'trips-impact-due-to-covid' &&
                    < TripsCovidImpact />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'trips-relationship-with-covid-cases' &&
                    < TripsRelationshipWithCovid />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'payment-method-trend' &&
                    < PaymentMethodTrend />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'change-of-tip-rates-from-2013-to-2020' &&
                    < TipRateChange />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'most-expensive-location' &&
                    <iframe
                      src='https://api.mapbox.com/styles/v1/xiaozhuoranyang/cko56ns5x0ins18pi9lulbol7.html?fresh=true&title=copy&access_token=pk.eyJ1IjoieGlhb3podW9yYW55YW5nIiwiYSI6ImNrbzU2MG03MjAwODgydXBiM2ZtY3F4cmsifQ.9mOv9w09dbRPQ1j9AyBkJw'
                      width='100%'
                      height='700px'
                      title='Most Expensive Pick-Up Location'>
                    </iframe>
                  }
                </div>
              </Content>
            </Layout>
          </Layout>
        )}
      </FirebaseAuthConsumer>
    </FirebaseAuthProvider >
  );
}

const onClockLogin = () => {
  const googleAuthProvider = new firebase.auth.GoogleAuthProvider();
  firebase.auth().signInWithPopup(googleAuthProvider);
}

const sjsuSignedIn = (isSignedIn, user) =>
  isSignedIn && user && user.email && user.email.indexOf("@sjsu.edu") > -1;

export default App;
