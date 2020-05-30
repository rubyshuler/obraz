import React from 'react'
import $ from 'jquery'

export default class OrderForm extends React.Component {
	constructor(props) {
		super(props)

		this.handleAddress = this.handleAddress.bind(this)
		this.handleSubmit = this.handleSubmit.bind(this)

		this.state = {
			order: {
				address: this.props.order.address
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

	handleAddress(e) {
		let address = e.target.value
		let newState = this.state
		newState.order.address = address

		this.setState({
			newState
		})
	}

	handleSubmit(e) {
		$.ajax({
				url: "/orders",
				dataType: 'JSON',
				type: 'POST',
				method: 'POST',
				data: {
					order: {
						address: this.state.order.address,
					}
				},
				success: response => {
					console.log('Order updated: ', response);
				}
			})
			.done(function (data) {
				window.location.replace('../orders/order_added')
			})
	}

	render() {
		const {
			order
		} = this.state

		return (
			<div className='order_form'>
        <h2>Доставка &#160;<span className='gray2'>(бесплатно)</span></h2>
        <div><div className='spacing-m-h'></div></div>

        <select className='default_input' disabled>
          <option>Почта России</option>
        </select>

        <div><div className='spacing-m-h'></div></div>

        <textarea
          className='default_input'
          type="text"
          name="shipped_at"
          placeholder='Адрес'
          value={ this.props.order.address }
          onChange={ this.handleAddress }
        />

        <div><div className='spacing-xxxl-h'></div></div>
        <h2>Оплата</h2>
        <div><div className='spacing-m-h'></div></div>

        <select className='default_input' disabled>
          <option>Наложенный платеж</option>
        </select>

        <div><div className='spacing-xxxl-h'></div></div>

        <button
          className='l_button primary_black'
          type="submit"
          value="Submit"
          onClick={this.handleSubmit}
          >
          Оформить заказ
        </button>

        <div><div className='spacing-huge-h'></div></div>
      </div>
		)
	}
}