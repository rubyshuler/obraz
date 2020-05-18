import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import DesignerOrders from '../containers/designer_orders'

document.addEventListener('DOMContentLoaded', () => {
  const designerOrders = JSON.parse(document.getElementsByClassName('order_pack')[0].dataset.props)

  ReactDOM.render(<DesignerOrders {...designerOrders}/>, document.getElementsByClassName('order_pack')[0].appendChild(document.createElement('section')))
})
