import React from 'react'
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import 'react-tabs/style/react-tabs.css';

import OrderList from '../components/order'

export default class DesignerOrders extends React.Component {
  constructor(props) {
		super(props)
    this.handleClick = this.handleClick.bind(this)

		this.state = {
      designer: {
        orders: this.props.designer.orders,
        activeStatus: 'paid'
      }
		}
	}

  handleClick = status => {
		let newState = this.state
		newState.designer.activeStatus = status

		this.setState({newState});
	};

  render(){
    const {orders, activeStatus} = this.state.designer;
    const findOrders = orders.filter(order => order.status === activeStatus);

    return(
      <div>
        <Tabs selectedTabClassName='active'>
          <TabList className='nav_tab'>
            <Tab className='tab' onClick={() => this.handleClick('paid')}>Новые</Tab>
            <Tab className='tab' onClick={() => this.handleClick('shipped')}>Отправленные</Tab>
            <Tab className='tab' onClick={() => this.handleClick('delivered')}>Завершенные</Tab>
          </TabList>
          <div><div className='spacing-xl-h'></div></div>
          <TabPanel>
            { (findOrders.length > 0)
              ? <OrderList orders={findOrders} />
              :  <div></div>
            }
          </TabPanel>
          <TabPanel>
            { (findOrders.length > 0)
              ? <OrderList orders={findOrders} />
              :  <div></div>
            }
          </TabPanel>
          <TabPanel>
            { (findOrders.length > 0)
              ? <OrderList orders={findOrders} />
              :  <div></div>
            }
          </TabPanel>
        </Tabs>
      </div>
    )
  }
}
