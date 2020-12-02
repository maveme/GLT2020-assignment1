module ccl::AST

/*
 * Define Abstract Syntax for CCL
 *
 * - make sure there is an almost one-to-one correspondence with the grammar (Syntax.rsc)
 */
 
 public alias AresourceId = str;
 public alias AmiId = str;
 
 // Datatypes
data AType(loc src = |tmp:///|)
    = string() | integer() | boolean();
 
 data AProgram 
 = Aprogram(AResource resource);
 
 data AResource
 = Aresource(AresourceId id, list[AMI] mis);
 
 data AMI 
 = Asmi(AId id, ASMI smi) 
 | Acmi(AId id, ACMI cmi)
 | Ami(AId id);
 
 data ASMI = Asmi(list[ASMIelement]);
 
 data ASMIelement 
 = Aregion(str reg)
 | Aengine(str eng)
 | ACPU(int cpu)
 | Amemory(int size)
 | AIPV6(str ipv6)
 | Astorage(str kind, int size);

 
 data ACMI 
 = Acmi(list[ACMIelement]);
 
 data ACMIelement 
 = Aregion(str reg)
 | AOS(str os)
 | AIPV6(str ipv6)
 | Astorage(str kind, int size)
 | ACPU(int size)
 | Amemory(int size);
 
 data AId
= Aid(str name);
 
