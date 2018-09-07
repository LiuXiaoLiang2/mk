import React from 'react';
import { Button, Modal, Form, Input, Select, Message ,DatePicker} from 'antd';
const createForm = Form.create;
const FormItem = Form.Item;
const RangePicker = DatePicker.RangePicker;
const Option = Select.Option;
const confirm = Modal.confirm;

let SeachForm = React.createClass({
    getInitialState() {
        return {
            roleList: []
        }
    },
    handleQuery() {
        var params = this.props.form.getFieldsValue();
		var json = {startDate:'',endDate:'',orderNo:params.orderNo,serialNumber:params.serialNumber,repayAccount:params.repayAccount,type:params.type};
		if(params.time){
			json.endDate=(DateFormat.formatDate(params.time[1])).substring(0,10);
			json.startDate=(DateFormat.formatDate(params.time[0])).substring(0,10);
         }
        this.props.passParams({
            searchParams: JSON.stringify(json),
            pageSize: 10,
            current: 1,
        });
    },
    handleReset() {
        this.props.form.resetFields();
        this.props.passParams({
            pageSize: 10,
            current: 1,
        });
    },
    handleOut() {
        var params = this.props.form.getFieldsValue();
	    var json = {startDate:'',endDate:'',orderNo:params.orderNo,serialNumber:params.serialNumber,repayAccount:params.repayAccount,type:params.type};
		if(params.time){
			json.endDate=(DateFormat.formatDate(params.time[1])).substring(0,10);
			json.startDate=(DateFormat.formatDate(params.time[0])).substring(0,10);
         }
		var json = JSON.stringify(json);
        window.open("/modules/manage/borrowRepayLog/export.htm?searchParams="+json);

    },
	 disabledDate(startValue) {
        var today = new Date();
        return startValue.getTime() > today.getTime();
    },
    render() {

        const { getFieldProps } = this.props.form;

        return (
			<Form inline>
				<FormItem label="还款时间:">
                  <RangePicker disabledDate={this.disabledDate}  {...getFieldProps('time', { initialValue: '' }) } />
                </FormItem>
                <FormItem label="订单号:">
                    <Input  {...getFieldProps('orderNo', { initialValue: '' }) } />
                </FormItem>
                <FormItem label="流水号:">
                    <Input  {...getFieldProps('serialNumber', { initialValue: '' }) } />
                </FormItem>
                <FormItem label="还款账号:">
                    <Input  {...getFieldProps('repayAccount', { initialValue: '' }) } />
                </FormItem>
                <FormItem label="是否金额减免:">
                    <Select style={{ width: 100 }} {...getFieldProps('type', { initialValue: '' }) }>
                        <Option value="">全部</Option>
                        <Option value="10">是</Option>
                        <Option value="20">不是</Option>
                    </Select>
                </FormItem>
                <FormItem><Button type="primary" onClick={this.handleQuery}>查询</Button></FormItem>
                <FormItem><Button type="reset" onClick={this.handleReset}>重置</Button></FormItem>
                <FormItem><Button onClick={this.handleOut}>导出</Button></FormItem>
            </Form>
        );
    }
});

SeachForm = createForm()(SeachForm);
export default SeachForm;