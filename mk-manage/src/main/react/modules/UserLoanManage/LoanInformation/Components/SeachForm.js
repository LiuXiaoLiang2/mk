import React from 'react';
import { Button, Form, Input, Select, Message, DatePicker } from 'antd';
const createForm = Form.create;
const FormItem = Form.Item;
const Option = Select.Option;
const RangePicker = DatePicker.RangePicker;

let SeachForm = React.createClass({
    getInitialState() {
        return {
            roleList: []
        }
    },
    handleQuery() {
        var params = this.props.form.getFieldsValue();
        var json = { startTime: '', endTime: '', realName: params.realName, phone: params.phone, orderNo: params.orderNo, state: params.state };
        //console.log(params);
        if (params.time[0]) {
            json.startTime = (DateFormat.formatDate(params.time[0])).substring(0, 10);
            json.endTime = (DateFormat.formatDate(params.time[1])).substring(0, 10);
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
        var json = { startTime: '', endTime: '', realName: params.realName, phone: params.phone, orderNo: params.orderNo, state: params.state };
        //console.log(params);
        if (params.time[0]) {
            json.startTime = (DateFormat.formatDate(params.time[0])).substring(0, 10);
            json.endTime = (DateFormat.formatDate(params.time[1])).substring(0, 10);
        }
        json = JSON.stringify(json)
        window.open("/modules/manage/borrow/export.htm?searchParams=" + json);

    },
    disabledDate(startValue) {
        var today = new Date();
        return startValue.getTime() > today.getTime();
    },
    render() {

        const { getFieldProps } = this.props.form;

        return (
            <Form inline>
                <FormItem label="真实姓名:">
                    <Input  {...getFieldProps('realName', { initialValue: '' }) } />
                </FormItem>
                <FormItem label="手机号码:">
                    <Input  {...getFieldProps('phone', { initialValue: '' }) } />
                </FormItem>
                <FormItem label="订单号:">
                    <Input  {...getFieldProps('orderNo', { initialValue: '' }) } />
                </FormItem>
                <FormItem label="订单状态:">
                    <Select style={{ width: 170 }} {...getFieldProps('state', { initialValue: '' }) }>
                        <Option value="">全部</Option>
                        <Option value="30">放款成功</Option>
                        <Option value="31">放款失败</Option>
                        <Option value="40">还款成功</Option>
                        <Option value="41">还款成功-金额减免</Option>
                        <Option value="43">还款处理中</Option>
                        <Option value="50">逾期</Option>
                        <Option value="90">坏账</Option>
                    </Select>
                </FormItem>
                <FormItem label="订单生成时间:">
	                <RangePicker disabledDate={this.disabledDate} {...getFieldProps('time', { initialValue: [] }) } />
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