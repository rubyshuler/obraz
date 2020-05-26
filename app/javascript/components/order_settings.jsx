import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'

export default class OrderSettings extends React.Component {
  constructor(props) {
    super(props)

    this.handleWeight = this.handleWeight.bind(this)
    this.handleShippedAt = this.handleShippedAt.bind(this)
    this.handleTrackingNumber = this.handleTrackingNumber.bind(this)
    this.handleDeliveredAt = this.handleDeliveredAt.bind(this)
  }

  handleWeight(e) {
    this.props.handleWeight(e.target.value)
  }

  handleShippedAt(e) {
    this.props.handleShippedAt(e.target.value)
  }

  handleTrackingNumber(e) {
    this.props.handleTrackingNumber(e.target.value)
  }

  handleDeliveredAt(e) {
    this.props.handleDeliveredAt(e.target.value)
  }

  render () {
    const {order} = this.props;

    return (
      <div className='refinement'>
        <textarea
          className='default_input'
          value={order.address.city + ', ' + order.address.street}
          disabled
        />

        <input
          className='default_input'
          type="number"
          name="weight"
          placeholder='Вес посылки'
          value={ this.props.order.weight }
          onChange={ this.handleWeight }
        />

        <input
          className='default_input'
          type="date"
          name="shipped_at"
          placeholder='Дата отправления'
          value={ this.props.order.shipped_at }
          onChange={ this.handleShippedAt }
          />

          <input
            className='default_input'
            type="text"
            name="shipped_at"
            placeholder='Трэк номер'
            value={ this.props.order.tracking_number }
            onChange={ this.handleTrackingNumber }
          />

        <input
          className='default_input'
          type="date"
          name="shipped_at"
          placeholder='Дата доставки'
          value={ this.props.order.delivered_at }
          onChange={ this.handleDeliveredAt }
          />
      </div>
    )
  }
}
