import React from 'react';
import Login from './registrations/Login'
import Dashboard from './dashboard/Dashboard'

class Home extends React.Component{
  render(){
    return (
      <div className='container home_image'>
        {this.props.loggedInStatus ?
        <Dashboard 
          addChildButton={this.props.addChildButton} 
          addBackButton={this.props.addBackButton} 
          addAppointmentButton={this.props.addAppointmentButton}
          addGrowthButton={this.props.addGrowthButton}
          addUsefulInformationButton={this.props.addUsefulInformationButton}
          loggedInStatus={this.props.loggedInStatus} 
          user={this.props.user} 
          children={this.props.children} 
          handleLogout={this.props.handleLogout}/>
        :
        <Login loggedInStatus={this.props.loggedInStatus} handleLogin={this.props.handleLogin}/>
  }
      </div>
    )
  }
}

export default Home;