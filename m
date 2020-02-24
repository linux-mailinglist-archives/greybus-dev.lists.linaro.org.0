Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C916AC41
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Feb 2020 17:54:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3FA461523
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Feb 2020 16:54:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C49D5618C3; Mon, 24 Feb 2020 16:54:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 65A2D61523;
	Mon, 24 Feb 2020 16:53:58 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D6F7860679
 for <greybus-dev@lists.linaro.org>; Mon, 24 Feb 2020 16:53:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C5F5560EBF; Mon, 24 Feb 2020 16:53:54 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by lists.linaro.org (Postfix) with ESMTPS id 2813560679
 for <greybus-dev@lists.linaro.org>; Mon, 24 Feb 2020 16:53:52 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z12so5450894pgl.4
 for <greybus-dev@lists.linaro.org>; Mon, 24 Feb 2020 08:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OdqiOQAOv7VgOZu/EsgkC0pt5i360/zcmmngPxMs3Jg=;
 b=c8eH537F8k9C8Mj25EE42C3zDGD2TP2jVt58q2ItrWdD8qhcSj/VHbMI8ikRSQyMFe
 jOlT4rKbUXDbOytKa9DKxm2U+sI7nmO0NOVZ42+QhNddrVwGZ71XHrwvhNebP28fDzaA
 vhWeKBi9zGIUToqyHSupcYqgVjIyb3QjSYDWpyG8NF8Qynsp1lu5oG5J1W/0aqyL5AQ2
 2ztT+tOHOmqXIdZkFJrH/Dy20oHJHp0FLq0T2MOeop6hzDrOY6dbfXtKxXCoAblLvOPS
 pjP+YNxEaR4J1CN9A7Phes7EtEs3TlFHCsyFZNNt/0JKJYLOadbNntYABhp5cTOB3CbH
 DE1w==
X-Gm-Message-State: APjAAAVXPqe8Zlv4HihTOQ41gEzo4NrCizZCvNYiIJGj6eLpA3a1J0Lj
 DlTowte6AjadfsyJwBvsRRTXmQ==
X-Google-Smtp-Source: APXvYqwte7KiY9kZcStaLGSCoQ5/ZSfRN+riGxvxmR5ZQ3DOW0cOn3YPqDfoZI5CgkmaWnC9sIt7JA==
X-Received: by 2002:a63:3004:: with SMTP id w4mr54015697pgw.164.1582563231181; 
 Mon, 24 Feb 2020 08:53:51 -0800 (PST)
Received: from kaaira-HP-Pavilion-Notebook ([103.37.201.170])
 by smtp.gmail.com with ESMTPSA id m12sm13189030pjf.25.2020.02.24.08.53.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Feb 2020 08:53:50 -0800 (PST)
From: Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date: Mon, 24 Feb 2020 22:23:44 +0530
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org
Message-ID: <20200224165344.GB7214@kaaira-HP-Pavilion-Notebook>
References: <20200219195651.GA485@kaaira-HP-Pavilion-Notebook>
 <20200224114929.GB4827@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224114929.GB4827@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: match parenthesis
 alignment
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDE6NDk6MjlQTSArMDIwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBLYWFpcmEsCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4g
T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDE6MjY6NTFBTSArMDUzMCwgS2FhaXJhIEd1cHRhIHdy
b3RlOgo+ID4gRml4IGNoZWNrcGF0Y2gucGwgd2FybmluZyBvZiBhbGlnbm1lbnQgc2hvdWxkIG1h
dGNoIG9wZW4gcGFyZW50aGVzaXMgaW4KPiA+IGF1ZGlvX2NvZGVjLmMKPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogS2FhaXJhIEd1cHRhIDxrZ3VwdGFAZXMuaWl0ci5hYy5pbj4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgfCA4ICsrKystLS0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jCj4gPiBpbmRleCAwODc0NmM4NWRlYTYu
LmQ2MmY5MWY0ZTlhMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1
ZGlvX2NvZGVjLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVj
LmMKPiA+IEBAIC03MCw3ICs3MCw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19tb2R1bGVfZW5hYmxl
X3R4KHN0cnVjdCBnYmF1ZGlvX2NvZGVjX2luZm8gKmNvZGVjLAo+ID4gIAkJaTJzX3BvcnQgPSAw
OwkvKiBmaXhlZCBmb3Igbm93ICovCj4gPiAgCQljcG9ydGlkID0gZGF0YS0+Y29ubmVjdGlvbi0+
aGRfY3BvcnRfaWQ7Cj4gPiAgCQlyZXQgPSBnYl9hdWRpb19hcGJyaWRnZWFfcmVnaXN0ZXJfY3Bv
cnQoZGF0YS0+Y29ubmVjdGlvbiwKPiA+IC0JCQkJCQlpMnNfcG9ydCwgY3BvcnRpZCwKPiA+ICsJ
CQkJCQkJaTJzX3BvcnQsIGNwb3J0aWQsCj4gPiAgCQkJCQkJQVVESU9fQVBCUklER0VBX0RJUkVD
VElPTl9UWCk7Cj4gCj4gSSdtIGN1cmlvdXMgdG8ga25vdyB3aHkgeW91IHRoaW5rIHRoZSBsaW5l
IHlvdSBjaGFuZ2VkIGRlc2VydmVzIGEKPiBtb2RpZmljYXRpb24sIHdoaWxlIHRoZSBuZXh0IG9u
ZSBkb2Vzbid0IDotKQoKQWNjb3JkaW5nIHRvIG1lLCBib3RoIHRoZSBsaW5lcyBkZXNlcnZlIGEg
bW9kaWZpY2F0aW9uLiBCdXQgSSBkaWQgbm90IGRvCnRoYXQgYXMgY2hhbmdpbmcgdGhlIG90aGVy
IGxpbmUgd2FzIHRocm93aW5nICdncmVhdGVyIHRoYW4gODAKY2hhcmFjdGVycycgd2FybmluZyBh
bmQgSSB3YXNuJ3Qgc3VyZSBpZiBJIHNob3VsZCBnbyBhaGVhZCB3aXRoIHRoZQpjaGFuZ2VzIGFu
eWhvdy4KCj4gCj4gPiAgCQlpZiAocmV0KSB7Cj4gPiAgCQkJZGV2X2Vycl9yYXRlbGltaXRlZCht
b2R1bGUtPmRldiwKPiA+IEBAIC0xNjAsNyArMTYwLDcgQEAgc3RhdGljIGludCBnYmF1ZGlvX21v
ZHVsZV9kaXNhYmxlX3R4KHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsIGludCBp
ZCkKPiA+ICAJCWkyc19wb3J0ID0gMDsJLyogZml4ZWQgZm9yIG5vdyAqLwo+ID4gIAkJY3BvcnRp
ZCA9IGRhdGEtPmNvbm5lY3Rpb24tPmhkX2Nwb3J0X2lkOwo+ID4gIAkJcmV0ID0gZ2JfYXVkaW9f
YXBicmlkZ2VhX3VucmVnaXN0ZXJfY3BvcnQoZGF0YS0+Y29ubmVjdGlvbiwKPiA+IC0JCQkJCQlp
MnNfcG9ydCwgY3BvcnRpZCwKPiA+ICsJCQkJCQkJICBpMnNfcG9ydCwgY3BvcnRpZCwKPiA+ICAJ
CQkJCQlBVURJT19BUEJSSURHRUFfRElSRUNUSU9OX1RYKTsKPiA+ICAJCWlmIChyZXQpIHsKPiA+
ICAJCQlkZXZfZXJyX3JhdGVsaW1pdGVkKG1vZHVsZS0+ZGV2LAo+ID4gQEAgLTIwNSw3ICsyMDUs
NyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fbW9kdWxlX2VuYWJsZV9yeChzdHJ1Y3QgZ2JhdWRpb19j
b2RlY19pbmZvICpjb2RlYywKPiA+ICAJCWkyc19wb3J0ID0gMDsJLyogZml4ZWQgZm9yIG5vdyAq
Lwo+ID4gIAkJY3BvcnRpZCA9IGRhdGEtPmNvbm5lY3Rpb24tPmhkX2Nwb3J0X2lkOwo+ID4gIAkJ
cmV0ID0gZ2JfYXVkaW9fYXBicmlkZ2VhX3JlZ2lzdGVyX2Nwb3J0KGRhdGEtPmNvbm5lY3Rpb24s
Cj4gPiAtCQkJCQkJaTJzX3BvcnQsIGNwb3J0aWQsCj4gPiArCQkJCQkJCWkyc19wb3J0LCBjcG9y
dGlkLAo+ID4gIAkJCQkJCUFVRElPX0FQQlJJREdFQV9ESVJFQ1RJT05fUlgpOwo+ID4gIAkJaWYg
KHJldCkgewo+ID4gIAkJCWRldl9lcnJfcmF0ZWxpbWl0ZWQobW9kdWxlLT5kZXYsCj4gPiBAQCAt
Mjk1LDcgKzI5NSw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19tb2R1bGVfZGlzYWJsZV9yeChzdHJ1
Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLCBpbnQgaWQpCj4gPiAgCQlpMnNfcG9ydCA9
IDA7CS8qIGZpeGVkIGZvciBub3cgKi8KPiA+ICAJCWNwb3J0aWQgPSBkYXRhLT5jb25uZWN0aW9u
LT5oZF9jcG9ydF9pZDsKPiA+ICAJCXJldCA9IGdiX2F1ZGlvX2FwYnJpZGdlYV91bnJlZ2lzdGVy
X2Nwb3J0KGRhdGEtPmNvbm5lY3Rpb24sCj4gPiAtCQkJCQkJaTJzX3BvcnQsIGNwb3J0aWQsCj4g
PiArCQkJCQkJCSAgaTJzX3BvcnQsIGNwb3J0aWQsCj4gPiAgCQkJCQkJQVVESU9fQVBCUklER0VB
X0RJUkVDVElPTl9SWCk7Cj4gPiAgCQlpZiAocmV0KSB7Cj4gPiAgCQkJZGV2X2Vycl9yYXRlbGlt
aXRlZChtb2R1bGUtPmRldiwKPiAKPiAtLSAKPiBSZWdhcmRzLAo+IAo+IExhdXJlbnQgUGluY2hh
cnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
