import * as React from "react";
import { Alert, Avatar, Button, Dropdown, Layout, Menu } from 'antd';
import { DownOutlined } from '@ant-design/icons';
import firebase from "firebase/app";
import "firebase/auth";
import { FirebaseAuthConsumer, FirebaseAuthProvider } from "@react-firebase/auth";

import "./App.css";
import firebaseConfig from "./firebaseConfig"; // Config acquired from https://console.firebase.google.com/u/1/project/sjsu-nyc-taxi-trips-analysis/settings/general

const { Header, Content, Footer } = Layout;

function App() {
  return (

    <FirebaseAuthProvider {...firebaseConfig} firebase={firebase}>
      <FirebaseAuthConsumer>
        {({ isSignedIn, user, providerId }) => (
          <Layout className="layout">
            <Header>
              <h1 style={{ color: 'white', margin: '0px', float: 'left' }}>
                NYC Taxi Trips Analysis
              </h1>
              {isSignedIn && user && user.email && user.email.indexOf("@sjsu.edu") > -1 && user.displayName &&
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
              {isSignedIn && user && user.email && user.email.indexOf("@sjsu.edu") > -1 && user.photoURL &&
                <div style={{ paddingBottom: '5px', paddingRight: '5px', float: 'right' }}>
                  <Avatar src={user.photoURL} />
                </div>
              }
            </Header>
            <Content style={{ padding: '30px 30px 0 30px' }}>
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
              </div>
            </Content>
            <Footer style={{ textAlign: 'center' }}>Proudly Presented by Group 6</Footer>
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

export default App;
