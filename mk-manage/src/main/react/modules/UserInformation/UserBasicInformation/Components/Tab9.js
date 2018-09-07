import React from 'react';
import {
  Table,
} from 'antd';
const objectAssign = require('object-assign');
var Tab9 = React.createClass({
  getInitialState() {
    return {
      reportUrl: null
    };
  },
  componentDidMount(){
    this.state = {}
    this.fetch();
  },

  componentWillReceiveProps(nextProps){
    this.state = {}
    if(nextProps.activeKey == '9' || nextProps.activeKey == '5'){
      this.fetch();
    }
  },

  fetch(params = {}) {
    this.setState({
      loading: true
    })
    Utils.getData({
      url: '/modules/manage/user/getOperator360Html.htm',
      data: {
        userId: this.props.record.userId || this.props.record.id
      },
      callback: (result) => {
        if(result.data && result.data.filePath){
          this.setState({
            reportUrl: result.data.filePath,
            loading: false
          });
        }else{
          this.setState({
            loading: false
          });
        }
      }
    });
  },
  _reDownload(){
    this.setState({
      loading: true
    })
    Utils.getData({
      url: '/modules/manage/user/downloadOperator360Html.htm',
      data: {
        userId: this.props.record.userId || this.props.record.id
      },
      callback: (result) => {
        if(result.data && result.data.filePath){
          this.setState({
            reportUrl: result.data.filePath,
            loading: false
          });
        }else{
          this.setState({
            loading: false
          });
        }
      }
    });
  },
  render() {

    if(this.state.reportUrl){
      
      return(
        <iframe style={{width: '100%', height: '500px'}} src={this.state.reportUrl}>
          
        </iframe>
      );
    }else{
      return (
        <div className="block-panel">
          {
            this.state.loading
            ?
            '正在获取报告...'
            :
            <span>没有运营商报告。<a href="javascript:;" onClick={this._reDownload}>重新下载</a></span>
          }
        </div>
      );
      
    }
    
  }
});
export default Tab9;