import React from 'react'
import $ from 'jquery'

import OrderSettings from '../components/order_settings'

export default class OrderRefinement extends React.Component {
  constructor(props) {
		super(props)

    this.handleWeight = this.handleWeight.bind(this)
    this.handleShippedAt = this.handleShippedAt.bind(this)
    this.handleTrackingNumber = this.handleTrackingNumber.bind(this)
    this.handleDeliveredAt = this.handleDeliveredAt.bind(this)

    this.handleSubmit = this.handleSubmit.bind(this)
    this.resetForm = this.resetForm.bind(this)

    this.state = {
      order: {
        id: this.props.order.id,
        address: this.props.order.address,
        weight: this.props.order.weight,
        shipped_at: this.props.order.shipped_at,
        tracking_number: this.props.order.tracking_number,
        delivered_at: this.props.order.delivered_at
      }
		}
    this.baseState = this.state
	}

  componentDidMount() {
    $.ajaxSetup({
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    })
  }

  handleWeight(weight) {
    let newState = this.state
    newState.order.weight = weight

    this.setState({
      newState
    })
  }

  handleShippedAt(shipped_at) {
    let newState = this.state
    newState.order.shipped_at = shipped_at

    this.setState({
      newState
    })
  }

  handleTrackingNumber(tracking_number) {
    let newState = this.state
    newState.order.tracking_number = tracking_number

    this.setState({
      newState
    })
  }

  handleDeliveredAt(delivered_at) {
    let newState = this.state
    newState.order.delivered_at = delivered_at

    this.setState({
      newState
    })
  }

  handleSubmit(e) {
    $.ajax({
      url: "/orders/" + this.props.order.id,
      dataType: 'JSON',
      type: 'PATCH',
      method: 'PATCH',
      data: {
        order: {
          weight: this.state.order.weight,
          shipped_at: this.state.order.shipped_at,
          tracking_number: this.state.order.tracking_number,
          delivered_at: this.state.order.delivered_at
        }
      },
      success: response => {
        console.log('Order updated: ', response);
      }
      })
      .done(function (data) {
        console.log("success", data, data.url);
    })
  }

  get initialState() {
    return {
      order: {
        id: this.props.order.id,
        address: this.props.order.address,
        weight: '',
        shipped_at: '',
        tracking_number: '',
        delivered_at: ''
      }
    };
  }

  resetForm() {
    this.setState(this.initialState);
  }

  render(){
    const {order} = this.state

    return(
      <div className='order_refinement'>
        <div><div className='spacing-xl-h'></div></div>
        <h1>
          Обработка заказа №{order.id}
          <span className='l_badge status_badge'>Оплачен</span>
        </h1>

        <div><div className='spacing-m-h'></div></div>

        <div><div className='spacing-xl-h'></div></div>
        <h2>Доставка почтой России</h2>
        <div><div className='spacing-m-h'></div></div>

        <OrderSettings
          order={order}
          handleWeight={this.handleWeight}
          handleShippedAt={this.handleShippedAt}
          handleTrackingNumber={this.handleTrackingNumber}
          handleDeliveredAt={this.handleDeliveredAt}
        />
        <div className='actions'>
          <button
            className='l_button primary_black'
            type="submit"
            value="Submit"
            onClick={this.handleSubmit}
          >
            Сохранить
          </button>
          <div><div className='spacing-l-w'></div></div>
          <button
            className='l_button flat'
            onClick={this.resetForm}
          >
            Отменить
          </button>
        </div>
      </div>
    )
  }
}
