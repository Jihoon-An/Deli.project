package kh.deli.domain.member.order.service;

import kh.deli.domain.member.order.dto.OrderOrdersDTO;
import kh.deli.domain.member.order.dto.OrdererInfoDTO;
import kh.deli.domain.member.order.dto.PayInfoDTO;
import kh.deli.domain.member.order.dto.StoreInfoDTO;
import kh.deli.domain.member.order.mapper.OrderOrdersMapper;
import kh.deli.global.entity.OrdersDTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class OrderOrdersService {

    @Autowired
    private OrderOrdersMapper orderOrdersMapper;

    public OrderOrdersDTO selectSessionInfo(OrderOrdersDTO param) {
        return orderOrdersMapper.selectSessionInfo(param);
    };
    public OrderOrdersDTO selectInitInfo(OrderOrdersDTO param) {
        return orderOrdersMapper.selectOrderMemberInfo(param);
    };

    public void updateMemberAddr(OrderOrdersDTO param) {
        orderOrdersMapper.updateMemberAddr(param);
    };

    public int updateMemberPhone(OrderOrdersDTO param){
        int result = orderOrdersMapper.updateMemberPhone(param);
        return result;
    };

    public List<OrderOrdersDTO> selectCouponList(OrderOrdersDTO param){

        return orderOrdersMapper.selectCouponList(param);
    }


    public StoreInfoDTO getStoreInfo(int order_seq) throws Exception{
        return orderOrdersMapper.getStoreInfo(order_seq);
    }


    public OrdererInfoDTO getOrdererInfo(int order_seq) throws Exception{
        return orderOrdersMapper.getOrdererInfo(order_seq);
    }

    public PayInfoDTO getPayInfo(int order_seq) throws Exception{
        return orderOrdersMapper.getPayInfo(order_seq);
    }

    public OrdersDTO findOrdersBySeq(int order_seq) throws Exception {
        return orderOrdersMapper.findOrdersBySeq(order_seq);
    }

    public void insertOrder(OrderOrdersDTO orderOrdersDTO) {
        orderOrdersMapper.insertOrder(orderOrdersDTO);
    }

    public void deleteCouponList(OrderOrdersDTO orderOrdersDTO){
        orderOrdersMapper.deleteCouponList(orderOrdersDTO);
    }

    public void updateOwnPoint(OrderOrdersDTO orderOrdersDTO){
        orderOrdersMapper.updateOwnPoint(orderOrdersDTO);
    }

}