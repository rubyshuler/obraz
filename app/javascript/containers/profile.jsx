import React from 'react'
import {
	Tab,
	Tabs,
	TabList,
	TabPanel
} from 'react-tabs';
import 'react-tabs/style/react-tabs.css';
import $ from 'jquery'

import UserInfo from '../components/user_info'
import UserSettings from '../components/user_settings'
import OrderList from '../components/order'

export default class Profile extends React.Component {
	constructor(props) {
		super(props)

		this.handleName = this.handleName.bind(this)
		this.handleSurname = this.handleSurname.bind(this)
		this.handleBirthdate = this.handleBirthdate.bind(this)
		this.handleInfoSubmit = this.handleInfoSubmit.bind(this)

		this.state = {
			user: {
				id: this.props.user.id,
				name: this.props.user.name,
				surname: this.props.user.surname,
				birthdate: this.props.user.birthdate,
				email: this.props.user.email,
				orders: this.props.user.orders
			}
		}
	}

	componentDidMount() {
		$.ajaxSetup({
			headers: {
				'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			}
		})
	}

	handleName(name) {
		let newState = this.state
		newState.user.name = name

		this.setState({
			newState
		})
	}

	handleSurname(surname) {
		let newState = this.state
		newState.user.surname = surname

		this.setState({
			newState
		})
	}

	handleBirthdate(birthdate) {
		let newState = this.state
		newState.user.birthdate = birthdate

		this.setState({
			newState
		})
	}

	handleInfoSubmit(e) {
		$.ajax({
				url: "../users/" + this.props.user.id,
				dataType: 'JSON',
				type: 'PATCH',
				method: 'PATCH',
				data: {
					user: {
						email: this.state.user.email,
						name: this.state.user.name,
						surname: this.state.user.surname,
						birthdate: this.state.user.birthdate
					}
				},
				success: response => {
					console.log('User updated: ', response);
				}
			})
			.done(function (data) {
				console.log("success", data, data.url);
			})
	}

	render() {
		const {
			user
		} = this.state
		const {
			orders
		} = this.state.user;

		return (
			<div>
        <Tabs selectedTabClassName='active'>
          <TabList className='nav_tab'>
            <Tab className='tab'>Личная информация</Tab>
            <Tab className='tab'>Заказы</Tab>
            <Tab className='tab'>Данные для входа</Tab>
          </TabList>

          <div><div className='spacing-xl-h'></div></div>

          <TabPanel>
            <UserInfo
              user={user}
              handleName={this.handleName}
              handleSurname={this.handleSurname}
              handleBirthdate={this.handleBirthdate}
            />
            <button
              className='l_button primary'
              type="submit"
              value="Submit"
              onClick={this.handleInfoSubmit}
              >
              Сохранить
            </button>
          </TabPanel>

          <TabPanel>
            <OrderList orders={orders} />
          </TabPanel>

          <TabPanel>
            <UserSettings
              user={user}
            />
          </TabPanel>
        </Tabs>
      </div>
		)
	}
}