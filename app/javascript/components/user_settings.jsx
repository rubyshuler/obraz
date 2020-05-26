import React from "react"
import PropTypes from "prop-types"

export default class UserSettings extends React.Component {
	constructor(props) {
		super(props)
		this.handleEmail = this.handleEmail.bind(this)
		this.handlePassword = this.handlePassword.bind(this)
		this.handleConfirmationPassword = this.handleConfirmationPassword.bind(this)
	}

	handleEmail(e) {
		this.props.handleEmail(e.target.value)
	}

	handlePassword(e) {
		this.props.handlePassword(e.target.value)
	}

	handleConfirmationPassword(e) {
		this.props.handleConfirmationPassword(e.target.value)
	}

	render() {
		return (<form className="profile_info" autoComplete="off">
			<div className='label_default_input'>
				<input
					className='default_input'
					type="email"
					name="email"
					placeholder='E-mail'
					autoComplete="off"
					value={this.props.user.email}
					onChange={this.handleEmail}
					/>
				<label className='grey2' for="email">E-mail</label>
			</div>
			<div>
				<div className='spacing-m-h'></div>
			</div>

			<div className='label_default_input'>
				<input
					className='default_input'
					type="password"
					name="password"
					placeholder='Пароль'
					autoComplete="off"
					value={this.props.user.password}
					onChange={this.handlePassword}
					/>
				<label className='grey2' for="password">Пароль</label>
			</div>

			<div>
				<div className='spacing-m-h'></div>
			</div>

			<div className='label_default_input'>
				<input
					className='default_input'
					type="password"
					name="password_confirmation"
					placeholder='Подтверждение пароля'
					autoComplete="off"
					value={this.props.user.password_confirmation}
					onChange={this.handleConfirmationPassword}
					/>
				<label className='grey2' for="password_confirmation">Подтверждение пароля</label>
			</div>
		</form>)
	}
}