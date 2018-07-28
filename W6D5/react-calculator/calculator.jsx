import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNums = this.addNums.bind(this);
    this.subtractNums = this.subtractNums.bind(this);
    this.multiplyNums = this.multiplyNums.bind(this);
    this.divideNums = this.divideNums.bind(this);
    this.clearNums = this.clearNums.bind(this);
  }

  setNum1(e) {
    if(e.target.value === "") this.setState({num1: ""});
    if(isNaN(parseInt(e.target.value))) return;
    this.setState({num1: parseInt(e.target.value)});
  }

  setNum2(e) {
    if(e.target.value === "") this.setState({num2: ""});
    if(isNaN(parseInt(e.target.value))) return;
    this.setState({num2: parseInt(e.target.value)});
  }

  addNums() {
    this.setState({result: this.state.num1 + this.state.num2});
  }

  subtractNums() {
    this.setState({result: this.state.num1 - this.state.num2});
  }

  multiplyNums() {
    this.setState({result: this.state.num1 * this.state.num2});
  }

  divideNums() {
    if (isNaN(this.state.num1) || isNaN(this.state.num2)) return;
    this.setState({result: this.state.num1 / this.state.num2});
  }

  clearNums() {
    this.setState({num1: "", num2: "", result: 0});
  }

  render() {
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input type="text" value={num1} onChange={this.setNum1}></input>
        <input type="text" value={num2} onChange={this.setNum2}></input>
        <button type="button" onClick={this.clearNums}>Clear</button>
        <br />

        <button type="text" onClick={this.addNums}>+</button>
        <button type="text" onClick={this.subtractNums}>-</button>
        <button type="text" onClick={this.multiplyNums}>*</button>
        <button type="text" onClick={this.divideNums}>/</button>
      </div>
    );
  }
}

export default Calculator;
