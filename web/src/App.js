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
import YellowTaxiOverview from './YellowTaxiOverview.js'

const { Header, Content, Sider } = Layout;

function App() {
  const [option, setOption] = useState('introduction');

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
                  <Menu.Item key='introduction' onClick={() => setOption('introduction')}>
                    Introduction
                  </Menu.Item>
                  <Menu.Item key='yellow-taxi-overview' onClick={() => setOption('yellow-taxi-overview')}>
                    Yellow Taxi Overview
                  </Menu.Item>
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
                  <Menu.Item key='dropoff-locations-from-JFK' onClick={() => setOption('dropoff-locations-from-JFK')}>
                    Drop-offs From JFK
                  </Menu.Item>
                  <Menu.Item key='payment-type-by-location' onClick={() => setOption('payment-type-by-location')}>
                    Payment Type by Loc
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
                  {sjsuSignedIn(isSignedIn, user) && option === 'introduction' &&
                    <Alert
                      message="Introduction"
                      type="info"
                      showIcon
                      description="In New York City, taxicabs, as widely recognizable symbols of the city, come in two varieties: yellow and green. Taxicabs are operated by private companies and licensed by the New York City Taxi and Limousine Commission (TLC).  Among them, only the taxis painted yellow have the right to pick up street-hailing and prearranged passengers anywhere in New York City. It is a typical analytic target to help us learn and study the life of residents of New York City by targeting the most important and the busiest zones. Meanwhile, due to Covid-19 pandemic in 2020, people started to stay at home and reduce time to go out. Therefore, it would be interesting to see the change of yellow taxi trips under the effect of Covid-19 and how it changes people’s lives in New York City."
                    />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'SummaryTable' &&
                    < SummaryTable />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'trips-impact-due-to-covid' &&
                    < TripsCovidImpact />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'trips-relationship-with-covid-cases' &&
                    < TripsRelationshipWithCovid />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'yellow-taxi-overview' &&
                    < YellowTaxiOverview />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'payment-method-trend' &&
                    < PaymentMethodTrend />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'change-of-tip-rates-from-2013-to-2020' &&
                    < TipRateChange />
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'most-expensive-location' &&
                    <iframe
                      src='https://api.mapbox.com/styles/v1/xiaozhuoranyang/ckob3op420q3c17p8yh62jmat.html?fresh=true&title=copy&access_token=pk.eyJ1IjoieGlhb3podW9yYW55YW5nIiwiYSI6ImNrb2F5bWJ0OTAzcjUybm8ydGFqdmkxYzEifQ.sflpZzMEDjNArZleZyvGbA'
                      width='100%'
                      height='800px'
                      title='Most Expensive Pick-Up Location'>
                    </iframe>
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'dropoff-locations-from-JFK' &&
                    <iframe
                      src='https://api.mapbox.com/styles/v1/xiaozhuoranyang/ckob2dkv60kuw18jr94ebdj05.html?fresh=true&title=view&access_token=pk.eyJ1IjoieGlhb3podW9yYW55YW5nIiwiYSI6ImNrb2F5bWJ0OTAzcjUybm8ydGFqdmkxYzEifQ.sflpZzMEDjNArZleZyvGbA'
                      width='100%'
                      height='800px'
                      title='Payment Type By Location'>
                    </iframe>
                  }
                  {sjsuSignedIn(isSignedIn, user) && option === 'payment-type-by-location' &&
                    <iframe
                      src='https://api.mapbox.com/styles/v1/xiaozhuoranyang/cko56ns5x0ins18pi9lulbol7.html?fresh=true&title=view&access_token=pk.eyJ1IjoieGlhb3podW9yYW55YW5nIiwiYSI6ImNrb2F5bWJ0OTAzcjUybm8ydGFqdmkxYzEifQ.sflpZzMEDjNArZleZyvGbA'
                      width='100%'
                      height='800px'
                      title='Payment Type By Location'>
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
