using my.bookshop as db from '../db/schema';

service AdminService @(requires:'admin') {
  @odata.draft.enabled
  entity Approval as projection on db.Approval;
  entity Books as projection on db.Books;
  entity Images as projection on db.Images;
  view BooksAnalytics as select from db.BooksAnalytics;
  entity Authors as projection on db.Authors;
  entity Orders as select from db.Orders;
  annotate Orders with @odata.draft.enabled;


  //------- auto-exposed --------
  entity OrderItems as projection on db.OrderItems;
  //> these shall be removed but this would break the Fiori UI

	@odata.draft.enabled
	entity Role
	@(restrict: [ { grant: ['READ','WRITE'], to: 'admin' }, ]) 
	as projection on db.Role;

  //------- auto-exposed --------
  entity Role_BusinessObject as projection on db.Role_BusinessObject;
  entity Role_User as projection on db.Role_User;
  //> these shall be removed but this would break the Fiori UI


	entity BusinessObjects 
	@(restrict: [ { grant: ['READ'], to: 'admin' }, ]) 
	as projection on db.BusinessObjects;

	entity Users 
	@(restrict: [ { grant: ['READ'], to: 'admin' }, ]) 
	as projection on db.Users;  
}
