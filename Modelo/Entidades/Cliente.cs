//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Modelo.Entidades
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cliente : Empresa
    {
        public Nullable<decimal> LimiteCredito { get; set; }
        public string Vendedor { get; set; }
        public Nullable<bool> CreditoLiberado { get; set; }
    }
}
