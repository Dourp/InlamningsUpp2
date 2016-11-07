using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ConsoleApplication1
{
    class Program
    {
        public static string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        static void Main(string[] args)
        {
            bool Done = false;

            while (!Done)
            {
                Console.WriteLine("Välj ett alternativ: 1) InsertCustomer 2) InsertProduct 3) UpdateProductPrice 4) Exit");
                int Inmatat = Convert.ToInt32(Console.ReadLine());

                switch (Inmatat)
                {
                    case 1: //InsertCustomer

                        Console.WriteLine("Mata in följande i samma utförande: CustomerID(5 bokstäver), CompanyName,\nContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax");
                        string inmatat2 = Console.ReadLine();
                        List<string> NyInmatat2 = inmatat2.Split(',').ToList();

                        if (NyInmatat2[0].Length == 5 && NyInmatat2.Count == 11)
                        {
                            SqlConnection cn = new SqlConnection(conString);
                            SqlCommand cmd = new SqlCommand("InsertCustomer", cn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@CustomerID", SqlDbType.NChar).Value = NyInmatat2[0].ToUpper().Trim();
                            cmd.Parameters.AddWithValue("@CompanyName", SqlDbType.NVarChar).Value = NyInmatat2[1].Trim();
                            cmd.Parameters.AddWithValue("@ContactName", SqlDbType.NVarChar).Value = NyInmatat2[2].Trim();
                            cmd.Parameters.AddWithValue("@ContactTitle", SqlDbType.NVarChar).Value = NyInmatat2[3].Trim();
                            cmd.Parameters.AddWithValue("@Address", SqlDbType.NVarChar).Value = NyInmatat2[4].Trim();
                            cmd.Parameters.AddWithValue("@City", SqlDbType.NVarChar).Value = NyInmatat2[5].Trim();
                            cmd.Parameters.AddWithValue("@Region", SqlDbType.NVarChar).Value = NyInmatat2[6].Trim();
                            cmd.Parameters.AddWithValue("@PostalCode", SqlDbType.NVarChar).Value = NyInmatat2[7].Trim();
                            cmd.Parameters.AddWithValue("@Country", SqlDbType.NVarChar).Value = NyInmatat2[8].Trim();
                            cmd.Parameters.AddWithValue("@Phone", SqlDbType.NVarChar).Value = NyInmatat2[9].Trim();
                            cmd.Parameters.AddWithValue("@Fax", SqlDbType.NVarChar).Value = NyInmatat2[10].Trim();

                            try
                            {
                                cn.Open();
                                cmd.ExecuteNonQuery();
                                Console.WriteLine("Ny customer inlagd");

                            }
                            catch (SqlException ex)
                            {
                                Console.WriteLine(ex);
                            }
                            finally
                            {
                                cn.Close();
                                cn.Dispose();
                            }
                        }
                        else if (NyInmatat2[0].Length != 5)
                        {
                            Console.WriteLine("CostumerID måste innhålla 5 bokstäver");
                        }
                        else if (NyInmatat2.Count != 11)
                        {
                            Console.WriteLine("Det måste finns 11 objekt! kan vara tomma");
                        }
                        Console.ReadLine();
                        break;

                    case 2: //InsertProduct();

                        Console.WriteLine("Mata in följande i samma utförande: ProductName, SupplierID(1-29), CategoryID(1-8),\nQuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discountinued(1/0)");
                        string inmatat3 = Console.ReadLine();
                        List<string> NyInmatat3 = inmatat3.Split(',').ToList();

                        if (NyInmatat3.Count == 9)
                        {
                            SqlConnection cn2 = new SqlConnection(conString);
                            SqlCommand cmd2 = new SqlCommand("InsertProduct", cn2);
                            cmd2.CommandType = CommandType.StoredProcedure;
                            cmd2.Parameters.AddWithValue("@ProductName", SqlDbType.NVarChar).Value = NyInmatat3[0].Trim();
                            cmd2.Parameters.AddWithValue("@SupplierID", SqlDbType.Int).Value = NyInmatat3[1].Trim();
                            cmd2.Parameters.AddWithValue("@CategoryID", SqlDbType.Int).Value = NyInmatat3[2].Trim();
                            cmd2.Parameters.AddWithValue("@QuantityPerUnit", SqlDbType.NVarChar).Value = NyInmatat3[3].Trim();
                            cmd2.Parameters.AddWithValue("@UnitPrice", SqlDbType.Money).Value = NyInmatat3[4].Trim();
                            cmd2.Parameters.AddWithValue("@UnitsInStock", SqlDbType.SmallInt).Value = NyInmatat3[5].Trim();
                            cmd2.Parameters.AddWithValue("@UnitsOnOrder", SqlDbType.SmallInt).Value = NyInmatat3[6].Trim();
                            cmd2.Parameters.AddWithValue("@ReorderLevel", SqlDbType.SmallInt).Value = NyInmatat3[7].Trim();
                            cmd2.Parameters.AddWithValue("@Discontinued", SqlDbType.Bit).Value = NyInmatat3[8].Trim();

                            try
                            {
                                cn2.Open();
                                cmd2.ExecuteNonQuery();
                                Console.WriteLine("Ny produkt inlagd");

                            }
                            catch (SqlException ex)
                            {
                                Console.WriteLine(ex);
                            }
                            finally
                            {
                                cn2.Close();
                                cn2.Dispose();
                            }
                        }
                        else if (NyInmatat3.Count != 9)
                        {
                            Console.WriteLine("Det måste finns 9 objekt! kan vara tomma");
                        }
                        Console.ReadLine();
                        break;

                    case 3://UpdateProductPrice();

                        Console.WriteLine("Mata in vilket ID på producten sen det nya priset");
                        string inmatat4 = Console.ReadLine();
                        List<string> NyInmatat4 = inmatat4.Split(',').ToList();

                        if (NyInmatat4.Count == 2)
                        {
                            SqlConnection cn3 = new SqlConnection(conString);
                            SqlCommand cmd3 = new SqlCommand("UpdateProductPrice", cn3);
                            cmd3.CommandType = CommandType.StoredProcedure;
                            cmd3.Parameters.Add("@ProductID", SqlDbType.Int).Value = NyInmatat4[0].Trim();
                            cmd3.Parameters.Add("@UnitPrice", SqlDbType.Money).Value = NyInmatat4[1].Trim();

                            try
                            {
                                cn3.Open();
                                cmd3.ExecuteNonQuery();
                                Console.WriteLine("Priset blev uppdaterat");

                            }
                            catch (SqlException ex)
                            {
                                Console.WriteLine(ex);
                            }
                            finally
                            {
                                cn3.Close();
                                cn3.Dispose();
                            }
                        }
                        else if (NyInmatat4.Count != 2)
                        {
                            Console.WriteLine("Det måste finns 2 objekt!");
                        }
                        Console.ReadLine();
                        break;

                    case 4:
                        Done = true;
                        break;

                    default:
                        Console.WriteLine("Felaktig inmatning, välj mellan 1-4");
                        break;
                }
            }

        }
    }
}
