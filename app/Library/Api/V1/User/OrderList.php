<?php


namespace App\Library\Api\V1\User;


use App\Models\Product;
use App\Traits\ProductTrait;
use App\Traits\ReviewTrait;

class OrderList
{
    use ReviewTrait, ProductTrait;

    public $orders;

    public function __construct($orders)
    {
        $this->orders = $orders;
    }

    public function execute()
    {
        $data = [];
        if (!empty($this->orders)) {
            $i = 0;
            foreach ($this->orders as $order) {
                $data[$i]['id'] = $order['id'];
                $data[$i]['order_number'] = $order['order_number'];
                $data[$i]['order_group_number'] = $order['order_group_number'];
                $data[$i]['vendor_id'] = $order['vendor_id'];
                $data[$i]['vendor'] = $order['vendor']['name'] ?? '';
                $data[$i]['payment_type'] = $order['payment_type'];
                $data[$i]['sub_total'] = $order['sub_total'] + $order['discount_amount'];
                $data[$i]['discount_amount'] = $order['discount_amount'];
                $data[$i]['gst_amount'] = $order['gst_amount'];
                $data[$i]['grand_total'] = $order['grand_total'];
                $data[$i]['amount_paid'] = $order['amount_paid'];
                $data[$i]['payment_status'] = $order['payment_status'];
                $data[$i]['status'] = $order['status'];
                $data[$i]['items_count'] = $order['order_items_count'];
                $data[$i]['created_at'] = date('d-m-Y', strtotime($order['created_at']));
                $i++;
            }
        }
        return $data;
    }
}

