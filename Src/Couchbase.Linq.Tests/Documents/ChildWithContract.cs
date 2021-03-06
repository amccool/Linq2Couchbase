﻿using System.Runtime.Serialization;

namespace Couchbase.Linq.Tests.Documents
{
    [DataContract]
    public class ChildWithContract
    {
        [DataMember(Name = "age")]
        public int Age { get; set; }

        [DataMember(Name = "fname")]
        public string FirstName { get; set; }

        public string Gender { get; set; }
    }
}