import React from "react";
import PropTypes from "prop-types";

function OrderList(props) {
  const {orders} = props;

  const ordersList = orders.map((order, index) => (
		<a href={"../../orders/" + order.id} key={index} className='order'>
      <div className='l_button primary'>Обработать заказ</div>
      <div className='order_title'>
        <h3>
          Заказ №{order.id},&#160;
          <span>{order.order_price}&#8381;</span>
        </h3>
        <div><div className='spacing-xs-w'></div></div>
        <div className='m_badge status_badge'>
          <span></span>
          Оплачен
        </div>
      </div>

      <div className='order_description'>
        <p>Поступил: {order.order_created_at}</p>
        <p>Доставка: {order.address.city}, {order.address.street}</p>
      </div>

      <div className='hr'></div>
      <div className='order_images'>
        <div><div className='spacing-xl-h'></div></div>
        {order.items.map((item, i) => {
          return (
            <div key={i} className='order_images'>
              <img src={item.first_image}></img>
            </div>
          );
        })}
        <div><div className='spacing-m-w'></div></div>
      </div>
		</a>
	))

  return (
    <div className='orders'>
      {ordersList}
    </div>
  );
}

export default OrderList;
