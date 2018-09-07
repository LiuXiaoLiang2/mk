import React from 'react';
const RotateImage = React.createClass({
  getInitialState() {
    return {
      rotate: 0,
      zoom: false
    }
  },

  _degToStyle(){
    return 'rotate(' + this.state.rotate + 'deg)';
  },
  _rotateLeft(e){
    e.preventDefault();
    e.stopPropagation();
    var deg = this.state.rotate - 90;
    if(deg == -360){
      deg  == 0;
    }
    this.setState({rotate: deg})
  },
  _rotateRight(e){
    e.preventDefault();
    e.stopPropagation();
    var deg = this.state.rotate + 90;
    if(deg == 360){
      deg  == 0;
    }
    this.setState({rotate: deg})
  },
  _toggleZoom(e){
    e.preventDefault();
    this.setState({
      zoom: !this.state.zoom
    })
  },
  _zoomStyleForImage(){
    if(this.state.zoom){
      return {
        width: 'auto',
        height: '100vh'
      }
    }else{
      return {}
    }
  },
  _zoomStyleForImageWrapper(){
    if(this.state.zoom){
      return {
        zIndex: 999,
        display: 'flex',
        alignItems: 'center',
        flexDirecton: 'column',
        justifyContent: 'center',
        position: 'fixed',
        top:0,
        left:0,
        textAlign: 'center',
        width:'100vw',
        background: 'rgba(0,0,0,0.8)'
      }
    }else{
      return {}
    }
  },
  render() {
    return(
      <div
        onClick={this._toggleZoom}
        style={{
          ...{display: 'inline-image', position: 'relative'},
          ...this._zoomStyleForImageWrapper()
        }}
      >
        <div style={{transform: this._degToStyle()}}>
          <img src={this.props.src} style={{...this.props.style, ...this._zoomStyleForImage()}} />
        </div>
        <div style={{position: 'absolute', left:0, top:0, background: 'rgba(0,0,0,0.8)'}}>
          <span style={{marginRight: 10, color: '#fff'}} onClick={this._rotateLeft}>左转</span>
          <span style={{marginRight: 10, color: '#fff'}} onClick={this._rotateRight}>右转</span>
        </div>
      </div>
    )
  }

})

export default RotateImage;