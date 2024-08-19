import { useState, useRef } from "react";
import defaultImage from "../../assets/images/no-image.png";
import { Button, Modal, Badge, Card, ListGroup, Form } from "react-bootstrap";
import { updateItem } from "../../services/ItemService";
import DisplayStatusIcon from "../item/ItemStatusIcon";

const ItemCardModal = ({ item }) => {
  const [show, setShow] = useState(false);
  const [formData, setFormData] = useState({
    comment: item.comment,
  });

  const handleClose = (e) => {
    setShow(false);
    setFormData({
      comment: item.comment,
    });
    setMessage("");
  };

  const handleShow = () => setShow(true);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((oldData) => ({
      ...oldData,
      [name]: value,
    }));
  };

  const handleSubmit = async () => {
    const newData = {
      comment: formData.comment,
    };

    try {
      await updateItem(item.id, newData);
      console.log("New comment");
    } catch (error) {
      console.log("Comment update error");
    }
  };

  return (
    <>
      <Button variant="outline-success" onClick={handleShow}>
        View
      </Button>

      <Modal
        show={show}
        onHide={handleClose}
        size="med"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title>
            {item.name}{" "}
            <Badge pill bg="primary">
              {item.quantity}
            </Badge>
            <DisplayStatusIcon item={item} />
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Card>
            <Card.Body>
              <Card.Img variant="top" src={item.image || defaultImage} />
            </Card.Body>
            <ListGroup variant="flush">
              <ListGroup.Item>
                Amazon Product ID: {item.amazonProductId}
              </ListGroup.Item>
              <ListGroup.Item>Description: {item.description}</ListGroup.Item>
              <ListGroup.Item>Location: {item.location}</ListGroup.Item>
              <ListGroup.Item>Item Cost: ${item.price}</ListGroup.Item>
              <ListGroup.Item>
                Minimum Quantity: {item.minQuantity}
              </ListGroup.Item>
              <br></br>
              <ListGroup.Item variant="info">Recent Comments: </ListGroup.Item>
              <ListGroup.Item>{item.comment}</ListGroup.Item>
            </ListGroup>
            <Form onSubmit={handleSubmit} id="updateItemForm">
              <Form.Group className="mb-3" controlId="itemComment">
                <Form.Control
                  as="textarea"
                  rows={4}
                  placeholder="Enter comment"
                  name="comment"
                  onChange={handleChange}
                />
              </Form.Group>
              <Button variant="secondary" type="submit" form="updateItemForm">
                Submit
              </Button>
            </Form>
          </Card>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="primary" onClick={handleClose}>
            Go Back
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default ItemCardModal;
