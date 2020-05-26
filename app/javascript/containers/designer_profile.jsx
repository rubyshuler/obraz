import React from 'react'
import {
	Tab,
	Tabs,
	TabList,
	TabPanel
} from 'react-tabs';
import 'react-tabs/style/react-tabs.css';

import ItemsList from '../components/items_list'
import LooksList from '../components/looks_list'

export default class DesignerProfile extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			designer: {
				items: this.props.designer.items,
				looks: this.props.designer.looks
			}
		}
	}

	render() {
		const {
			items,
			looks
		} = this.state.designer;

		return (
			<div>
        <Tabs selectedTabClassName='active'>
          <TabList className='nav_tab'>
            <Tab className='tab'>Товары</Tab>
            <Tab className='tab'>Образы</Tab>
          </TabList>
          <div><div className='spacing-xl-h'></div></div>
          <TabPanel>
            <ItemsList items={items} />
          </TabPanel>

          <TabPanel>
            <LooksList looks={looks} />
          </TabPanel>
        </Tabs>

        <div><div className='spacing-xxxl-h'></div></div>
      </div>
		)
	}
}