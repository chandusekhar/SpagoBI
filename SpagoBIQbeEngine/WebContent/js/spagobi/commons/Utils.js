/**
 * SpagoBI - The Business Intelligence Free Platform
 *
 * Copyright (C) 2004 - 2011 Engineering Ingegneria Informatica S.p.A.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 * 
 **/
 
/**
  * Object name 
  * 
  * [description]
  * 
  * 
  * Public Functions
  * 
  *  [list]
  * 
  * 
  * Authors
  * 
  * - Andrea Gioia (adrea.gioia@eng.it)
  */

Ext.ns("Sbi.qbe.commons");

Sbi.qbe.commons.Utils = function(){
 
    // private variables
	
    // public space
	return {
		
		unimplementedFunction: function(fnName) {
			var msg = fnName? 
				'Sorry, the functionality [' + fnName + '] has not been implemented yet':
				'Sorry, this functionality has not been implemented yet';
				
			Ext.Msg.show({
				   title:'Unimplemented functionality',
				   msg: msg,
				   buttons: Ext.Msg.OK,
				   icon: Ext.MessageBox.INFO
			});
		}
	
	    , deprectadeFunction: function(fnClass, fnName) {
			var msg = fnName + ' in class ' + fnClass + 'is deprecated';
				
			Ext.Msg.show({
				   title:'Deprecated functionality',
				   msg: msg,
				   buttons: Ext.Msg.OK,
				   icon: Ext.MessageBox.ERROR
			});
		}
	
		
		, log: function(severity, message) {
			this.unimplementedFunction('Sbi.qbe.commons.log');
		}
		
		, assertTrue: function(condition, msg) {
			this.unimplementedFunction('Sbi.qbe.commons.assertTrue');
		}
		
		, randomString: function() {
			var chars = "ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
			var string_length = 8;
			var randomstring = '';
			for (var i=0; i<string_length; i++) {
				var rnum = Math.floor(Math.random() * chars.length);
				randomstring += chars.substring(rnum,rnum+1);
			}
			return randomstring;
		}
		
		, encodeEscapes: function(string) {
			var encodedHtml = string;
			encodedHtml = encodedHtml.replace(/\"/g,"&quot;");
			//encodedHtml = encodedHtml.replace(/\'/g,"&apos;");
			encodedHtml = encodedHtml.replace(/</g,"&lt;");
			encodedHtml = encodedHtml.replace(/>/g,"&gt;");
			return encodedHtml;
		}
		
		
        /**
         * It is similar to Ext.isEmpty but it doesn't have the allowBlank input parameter 
         * and it checks also for empty JSON objects (i.e. {} object is considered to be empty).
         * @param {Mixed} value The value to test
         * @return {Boolean}
         */
		, isEmpty: function(obj) {
			if (v === undefined || v === null || ((Ext.isArray(v) && !v.length)) || v === '') {
				return true;
			}
		    for ( var prop in obj ) {
		        if ( obj.hasOwnProperty( prop ) )
		            return false;
		    }
		    return true;
		}
        
	};
}();








// ----- deprecated ------------------------------------------------------------------------------
Ext.namespace('it.eng.spagobi.engines.qbe.commons');


it.eng.spagobi.engines.qbe.commons = function(){
	// do NOT access DOM from here; elements don't exist yet
 
    // private variables
   
 
    // public space
	return {
	
		init : function() {
			//alert("init");
		},
		
		toStr : function(o) {
			var str = "";
			
			if(o === 'undefined') return 'undefined';
			
			str += "Type: [" + typeof(o) + "]\n------------------------\n";
			
	        for(p in o) {
	        	str += p + ": " +  o[p] + "\n";
	        }
	        return str;
		},
		
		dump : function(o) {
			alert(this.toStr(o));
		}
        
	};
}();

//----- deprecated ------------------------------------------------------------------------------


						