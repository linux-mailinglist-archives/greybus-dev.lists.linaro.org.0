Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483C2B5645
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Nov 2020 02:32:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 64FE460639
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Nov 2020 01:32:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 59A9760F1E; Tue, 17 Nov 2020 01:32:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6D3D1619B0;
	Tue, 17 Nov 2020 01:32:29 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9F88E619B0
 for <greybus-dev@lists.linaro.org>; Mon, 16 Nov 2020 20:46:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 91C42666E0; Mon, 16 Nov 2020 20:46:55 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by lists.linaro.org (Postfix) with ESMTPS id 33C49619B0
 for <greybus-dev@lists.linaro.org>; Mon, 16 Nov 2020 20:46:54 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m16so5274501edr.3
 for <greybus-dev@lists.linaro.org>; Mon, 16 Nov 2020 12:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAACKfn8rangRcEQUTh4m0a+pQ/FoGsxDIe/USx04Pc=;
 b=phAkL034vvKWlLohepWRH1u8FR4NHtVYpXp0diuVW8AnGg4I51Z/qmIxIQ6lpvkasc
 E2Y1/NvVIa5E/Pu5X50u8YBA5DGFwaioNBJfLVpMQvggusFt8PfEMDdvJ/PnlXM4yQ8A
 /cwJPwCIDOd9I0Olip+n6hMFjd8w2B6acPd8ngaQoA5Wy4xkak1uMQtx189ZKKhxZH4J
 rRmeFi6DHU6AhbcyB5AEGW8wOWUhCLWAJH3d9Li3gPf+PMhacW/4EXRrpbotwbjUkTfH
 r6XwBrTmRh+Dpw8IpM+wyicArAAYtni6Pz/gLwZtk9/H4keby6drYgaG2nxTCDdAor/x
 zRrQ==
X-Gm-Message-State: AOAM531hCrF0cfMXlLhWcLoYDrNolnduNCvk6di3kjoMdcF5QuUIrce/
 gIG1uZFOX0joPIkMr2w64oI=
X-Google-Smtp-Source: ABdhPJzEgI6lgq+IS1YB4MTYWmGSGYoDGNeoaA8Wv2A2qy4+Z8vZsdoIYhz5+C6+snWbjesAMBrXVw==
X-Received: by 2002:a05:6402:7c7:: with SMTP id
 u7mr17447179edy.351.1605559613261; 
 Mon, 16 Nov 2020 12:46:53 -0800 (PST)
Received: from localhost.localdomain
 (ptr-d0vvtt9s69zjdfz9c1k.18120a2.ip6.access.telenet.be.
 [2a02:1811:b214:8000:467b:ead9:6950:d438])
 by smtp.gmail.com with ESMTPSA id l20sm10992048eja.40.2020.11.16.12.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 12:46:52 -0800 (PST)
From: Emmanouil Perselis <perselis.e@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 16 Nov 2020 21:43:23 +0100
Message-Id: <20201116204322.2122-1-perselis.e@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <66314332-e66d-9b34-52f9-ae005df2be15@ieee.org>
References: <66314332-e66d-9b34-52f9-ae005df2be15@ieee.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 17 Nov 2020 01:32:27 +0000
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 johan@kernel.org, greybus-dev@lists.linaro.org,
 Emmanouil Perselis <perselis.e@gmail.com>
Subject: [greybus-dev] [PATCH] Fix warning for static const char * array in
	audio_manager_module.c
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

T24gMTEvMTUvMjAgOToxNyBBTSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+IE9uIFN1biwg
Tm92IDE1LCAyMDIwIGF0IDAzOjUzOjE2UE0gKzAxMDAsIEVtbWFub3VpbCBQZXJzZWxpcyB3cm90
ZToKPj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgd2FybmluZyAic3RhdGljIGNvbnN0IGNoYXIgKiBh
cnJheSBzaG91bGQKPj4gcHJvYmFibHkgYmUgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCIgaW4K
Pj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYwoKPj4gSSB0
aGluayBHcmVnJ3MgcGF0Y2ggYm90IGlzIHRlbGxpbmcgeW91IHRoYXQgeW91IG5lZWQKPj4gdG8g
Y2FyYm9uLWNvcHkgdGhlIG1haWxpbmcgbGlzdCBvbiB5b3VyIHBhdGNoIHN1Ym1pc3Npb24sCj4+
IG5vdCBqdXN0IGFkZHJlc3MgaXQgdG8gdGhlIG1haW50YWluZXJzLgoKQWRkZWQgYWRkcmVzc2Vz
IHRvIGNhcmJvbiBjb3B5LgoKPj4JCQkJCS1BbGV4Cgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBFbW1h
bm91aWwgUGVyc2VsaXMgPHBlcnNlbGlzLmVAZ21haWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jIHwgMiArLQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXJfbW9kdWxlLmMKPj4gaW5kZXggMmJmZDgw
NDE4M2M0Li42ZWY3MzgxZjRlODUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX21hbmFnZXJfbW9kdWxlLmMKPj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYwo+PiBAQCAtMTU4LDcgKzE1OCw3IEBAIHN0YXRpYyB2
b2lkIHNlbmRfYWRkX3VldmVudChzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdlcl9tb2R1bGUgKm1vZHVs
ZSkKPj4gICAJY2hhciBpcF9kZXZpY2VzX3N0cmluZ1s2NF07Cj4+ICAgCWNoYXIgb3BfZGV2aWNl
c19zdHJpbmdbNjRdOwo+PiAgIAo+PiAtCWNoYXIgKmVudnBbXSA9IHsKPj4gKwlzdGF0aWMgY29u
c3QgY2hhciAqIGNvbnN0IGVudnBbXSA9IHsKPj4gICAJCW5hbWVfc3RyaW5nLAo+PiAgIAkJdmlk
X3N0cmluZywKPj4gICAJCXBpZF9zdHJpbmcsCj4+IC0tIAo+PiAyLjIwLjEKPj4KPiAKPiBIaSwK
PiAKPiBUaGlzIGlzIHRoZSBmcmllbmRseSBwYXRjaC1ib3Qgb2YgR3JlZyBLcm9haC1IYXJ0bWFu
LiAgWW91IGhhdmUgc2VudCBoaW0KPiBhIHBhdGNoIHRoYXQgaGFzIHRyaWdnZXJlZCB0aGlzIHJl
c3BvbnNlLiAgSGUgdXNlZCB0byBtYW51YWxseSByZXNwb25kCj4gdG8gdGhlc2UgY29tbW9uIHBy
b2JsZW1zLCBidXQgaW4gb3JkZXIgdG8gc2F2ZSBoaXMgc2FuaXR5IChoZSBrZXB0Cj4gd3JpdGlu
ZyB0aGUgc2FtZSB0aGluZyBvdmVyIGFuZCBvdmVyLCB5ZXQgdG8gZGlmZmVyZW50IHBlb3BsZSks
IEkgd2FzCj4gY3JlYXRlZC4gIEhvcGVmdWxseSB5b3Ugd2lsbCBub3QgdGFrZSBvZmZlbmNlIGFu
ZCB3aWxsIGZpeCB0aGUgcHJvYmxlbQo+IGluIHlvdXIgcGF0Y2ggYW5kIHJlc3VibWl0IGl0IHNv
IHRoYXQgaXQgY2FuIGJlIGFjY2VwdGVkIGludG8gdGhlIExpbnV4Cj4ga2VybmVsIHRyZWUuCj4g
Cj4gWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtZXNzYWdlIGJlY2F1c2Ugb2YgdGhlIGZvbGxvd2lu
ZyBjb21tb24gZXJyb3IocykKPiBhcyBpbmRpY2F0ZWQgYmVsb3c6Cj4gCj4gLSBZb3VyIHBhdGNo
IHdhcyBzZW50IHByaXZhdGVseSB0byBHcmVnLiAgS2VybmVsIGRldmVsb3BtZW50IGlzIGRvbmUg
aW4KPiAgICBwdWJsaWMsIHBsZWFzZSBhbHdheXMgY2M6IGEgcHVibGljIG1haWxpbmcgbGlzdCB3
aXRoIGEgcGF0Y2gKPiAgICBzdWJtaXNzaW9uLiAgVXNpbmcgdGhlIHRvb2wsIHNjcmlwdHMvZ2V0
X21haW50YWluZXIucGwgb24gdGhlIHBhdGNoCj4gICAgd2lsbCB0ZWxsIHlvdSB3aGF0IG1haWxp
bmcgbGlzdCB0byBjYy4KPiAKPiAtIFlvdSBkaWQgbm90IHNwZWNpZnkgYSBkZXNjcmlwdGlvbiBv
ZiB3aHkgdGhlIHBhdGNoIGlzIG5lZWRlZCwgb3IKPiAgICBwb3NzaWJseSwgYW55IGRlc2NyaXB0
aW9uIGF0IGFsbCwgaW4gdGhlIGVtYWlsIGJvZHkuICBQbGVhc2UgcmVhZCB0aGUKPiAgICBzZWN0
aW9uIGVudGl0bGVkICJUaGUgY2Fub25pY2FsIHBhdGNoIGZvcm1hdCIgaW4gdGhlIGtlcm5lbCBm
aWxlLAo+ICAgIERvY3VtZW50YXRpb24vU3VibWl0dGluZ1BhdGNoZXMgZm9yIHdoYXQgaXMgbmVl
ZGVkIGluIG9yZGVyIHRvCj4gICAgcHJvcGVybHkgZGVzY3JpYmUgdGhlIGNoYW5nZS4KPiAKPiAt
IFlvdSBkaWQgbm90IHdyaXRlIGEgZGVzY3JpcHRpdmUgU3ViamVjdDogZm9yIHRoZSBwYXRjaCwg
YWxsb3dpbmcgR3JlZywKPiAgICBhbmQgZXZlcnlvbmUgZWxzZSwgdG8ga25vdyB3aGF0IHRoaXMg
cGF0Y2ggaXMgYWxsIGFib3V0LiAgUGxlYXNlIHJlYWQKPiAgICB0aGUgc2VjdGlvbiBlbnRpdGxl
ZCAiVGhlIGNhbm9uaWNhbCBwYXRjaCBmb3JtYXQiIGluIHRoZSBrZXJuZWwgZmlsZSwKPiAgICBE
b2N1bWVudGF0aW9uL1N1Ym1pdHRpbmdQYXRjaGVzIGZvciB3aGF0IGEgcHJvcGVyIFN1YmplY3Q6
IGxpbmUgc2hvdWxkCj4gICAgbG9vayBsaWtlLgo+IAo+IElmIHlvdSB3aXNoIHRvIGRpc2N1c3Mg
dGhpcyBwcm9ibGVtIGZ1cnRoZXIsIG9yIHlvdSBoYXZlIHF1ZXN0aW9ucyBhYm91dAo+IGhvdyB0
byByZXNvbHZlIHRoaXMgaXNzdWUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gcmVzcG9uZCB0byB0aGlz
IGVtYWlsIGFuZAo+IEdyZWcgd2lsbCByZXBseSBvbmNlIGhlIGhhcyBkdWcgb3V0IGZyb20gdGhl
IHBlbmRpbmcgcGF0Y2hlcyByZWNlaXZlZAo+IGZyb20gb3RoZXIgZGV2ZWxvcGVycy4KPiAKPiB0
aGFua3MsCj4gCj4gZ3JlZyBrLWgncyBwYXRjaCBlbWFpbCBib3QKPiAKCgpTaWduZWQtb2ZmLWJ5
OiBFbW1hbm91aWwgUGVyc2VsaXMgPHBlcnNlbGlzLmVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXJfbW9kdWxlLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYwppbmRleCAyYmZkODA0MTgzYzQuLjZlZjcz
ODFmNGU4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdl
cl9tb2R1bGUuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21v
ZHVsZS5jCkBAIC0xNTgsNyArMTU4LDcgQEAgc3RhdGljIHZvaWQgc2VuZF9hZGRfdWV2ZW50KHN0
cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZSAqbW9kdWxlKQogCWNoYXIgaXBfZGV2aWNlc19z
dHJpbmdbNjRdOwogCWNoYXIgb3BfZGV2aWNlc19zdHJpbmdbNjRdOwogCi0JY2hhciAqZW52cFtd
ID0geworCXN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZW52cFtdID0gewogCQluYW1lX3N0cmlu
ZywKIAkJdmlkX3N0cmluZywKIAkJcGlkX3N0cmluZywKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
