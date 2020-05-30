import React from "react"
import PropTypes from "prop-types"

const ShoppingCartPopup = ({
	handleClose,
	itemShow,
	children
}) => {
	const showHideClassName = itemShow ? 'shopping_cart_item display-block' : 'shopping_cart_item display-none';

	return (<div className={showHideClassName}>
    <div className=''>
      {children}
    </div>
  </div>);
};

export default ShoppingCartPopup;