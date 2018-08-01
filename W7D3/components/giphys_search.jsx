import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({
      searchTerm: e.target.value
    });
  }

  handleSubmit(e) {
    let { giphys, fetchSearchGiphys } = this.props;
    e.preventDefault();
    fetchSearchGiphys(this.state.searchTerm).then((res) => console.log(res));
    this.setState({
      searchTerm: ""
    });
  }

  render() {
    let { giphys } = this.props;
    
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input type="text" value={this.state.searchTerm} onChange={this.handleChange}></input>
          <input type="submit" value="Search"></input>
        </form>
        <GiphysIndex giphys={giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
