//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace projekt_bazy
{
    using System;
    using System.Collections.Generic;
    
    public partial class rooms_members
    {
        public int id_user { get; set; }
        public int id_room { get; set; }
        public Nullable<System.DateTime> exit_date { get; set; }
    
        public virtual rooms rooms { get; set; }
        public virtual users users { get; set; }
    }
}
