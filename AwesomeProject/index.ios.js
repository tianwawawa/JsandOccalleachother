/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  TouchableOpacity,
  Text,
  View,
  NativeModules,
  NativeAppEventEmitter
} from 'react-native';
const RnOcModule = NativeModules.RnOcModule

export default class AwesomeProject extends Component {
  constructor(props){
    super(props)
    this.state = {

    }
    this.callback = this.callback.bind(this)
  }

    componentDidMount() {
        // this.subscription = NativeAppEventEmitter.addListener(
        //     'typeChange',
        //     (result)  => alert(result.type)
        // );


        this.subscription = NativeAppEventEmitter.addListener(
            'ocCallJs',
            (result)=>{
              alert('4444eeee')
            }
        );
        // alert(this.subscription)
    }

    componentWillUnmount() {
        this.subscription.remove();
    }

  //js调用oc  callback函数连个参数 NSNumber 和 你要返回的东西
  callback(){
    // RnOcModule.JScallOc('hello',(num,result)=>{
    //   alert(result)
    // })
      RnOcModule.OcCallJs()
  }
  render() {
    return (
        <View style={styles.container}>
          <TouchableOpacity  onPress={this.callback}>
            <Text style={styles.welcome}>
              js 调用原生代码
             </Text>
           </TouchableOpacity>
        </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);
