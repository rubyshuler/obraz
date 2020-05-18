import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'

export default class UserInfo extends React.Component {
  constructor(props) {
    super(props)

    this.handleName = this.handleName.bind(this)
    this.handleSurname = this.handleSurname.bind(this)
    this.handleBirthdate = this.handleBirthdate.bind(this)
  }

  handleName(e) {
    this.props.handleName(e.target.value)
  }

  handleSurname(e) {
    this.props.handleSurname(e.target.value)
  }

  handleBirthdate(e) {
    this.props.handleBirthdate(e.target.value)
  }

  render () {
    return (
      <form className="profile_info" method = "patch">
        <input
          className='default_input'
          type="text"
          name="name"
          placeholder='Имя'
          value={ this.props.user.name }
          onChange={ this.handleName }
        />

        <div><div className='spacing-m-h'></div></div>

        <input
          className='default_input'
          type="text"
          name="surname"
          placeholder='Фамилия'
          value={ this.props.user.surname }
          onChange={ this.handleSurname }
        />

        <div><div className='spacing-m-h'></div></div>

        <input
          className='default_input'
          type="date"
          name="birthdate"
          placeholder='Дата рождения'
          value={ this.props.user.birthdate }
          onChange={ this.handleBirthdate }
          />

        <div><div className='spacing-m-h'></div></div>
      </form>
    )
  }
}
