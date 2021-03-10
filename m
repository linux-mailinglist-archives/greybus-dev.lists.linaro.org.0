Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E609333FED
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 15:07:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 955F4617DA
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 14:07:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 88B54618DF; Wed, 10 Mar 2021 14:07:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_PASS autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ADA81665E9;
	Wed, 10 Mar 2021 14:07:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 575FC617DA
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:07:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4915B665B5; Wed, 10 Mar 2021 14:07:18 +0000 (UTC)
Received: from ustc.edu.cn (smtp2.ustc.edu.cn [202.38.64.46])
 by lists.linaro.org (Postfix) with ESMTP id 1D965617DA
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:07:14 +0000 (UTC)
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Wed, 10 Mar
 2021 22:07:05 +0800 (GMT+08:00)
X-Originating-IP: [114.214.224.243]
Date: Wed, 10 Mar 2021 22:07:05 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: lyl2019@mail.ustc.edu.cn
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20190610(cb3344cf) Copyright (c) 2002-2021 www.mailtech.cn ustc-xl
In-Reply-To: <YEiSOB05c0iyOFFj@kroah.com>
References: <20210310091014.6407-1-lyl2019@mail.ustc.edu.cn>
 <YEiSOB05c0iyOFFj@kroah.com>
X-SendMailWithSms: false
MIME-Version: 1.0
Message-ID: <180e2dc9.9f50.1781c7669f7.Coremail.lyl2019@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygBXXJCJ0khgFb0EAA--.0W
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/1tbiAQsQBlQhn477VgALse
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus/operation: Drop reference when
 message has been set
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

U29ycnksIGkgbWlzdGFrZW5seSBkaXZpZGVkIHRoZSBwYXRjaCBpbnRvIHR3byBjb21taXRzLiBX
aGF0IGkgaGF2ZSBzZW50DQppcyB0aGUgbGF0ZXN0IGNvbW1pdCB3aGljaCBjb3JyZWN0ZWQgbXkg
Z3JhbW1hciBpbiB0aGUgcGF0Y2guDQoNCkkgd2lsbCBzZW5kIHRoZSBmdWxsIHBhdGNoIHNvb24u
DQoNCg0KPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tDQo+IOWPkeS7tuS6ujogIkdyZWcgS0giIDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4g5Y+R6YCB5pe26Ze0OiAyMDIxLTAzLTEwIDE3
OjMyOjQwICjmmJ/mnJ/kuIkpDQo+IOaUtuS7tuS6ujogIkx2IFl1bmxvbmciIDxseWwyMDE5QG1h
aWwudXN0Yy5lZHUuY24+DQo+IOaKhOmAgTogam9oYW5Aa2VybmVsLm9yZywgZWxkZXJAa2VybmVs
Lm9yZywgZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZywgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPiDkuLvpopg6IFJlOiBbUEFUQ0hdIGdyZXlidXMvb3BlcmF0aW9uOiBEcm9wIHJl
ZmVyZW5jZSB3aGVuIG1lc3NhZ2UgaGFzIGJlZW4gc2V0DQo+IA0KPiBPbiBXZWQsIE1hciAxMCwg
MjAyMSBhdCAwMToxMDoxNEFNIC0wODAwLCBMdiBZdW5sb25nIHdyb3RlOg0KPiA+IEluIGdiX29w
ZXJhdGlvbl9yZXNwb25zZV9zZW5kLCBnZXQgYW4gZXh0cmEgcmVmZXJlbmNlDQo+ID4gYmVmb3Jl
IGdiX21lc3NhZ2Vfc2VuZCgpIHdpdGggdGhpcyBjb21tZW50ICIvKiBSZWZlcmVuY2Ugd2lsbA0K
PiA+IGJlIGRyb3BwZWQgd2hlbiBtZXNzYWdlIGhhcyBiZWVuIHNlbnQuICovIi4gVGhlcmVmb3Jl
LCB3ZQ0KPiA+IHNob3VsZCBkcm9wIHRoZSBnb3QgcmVmZXJlbmNlIG5vdCBvbmx5IGluIHRoZSBl
cnJvciBicmFuY2gsDQo+ID4gYnV0IGFsc28gaW4gdGhlIGNvbXBsZXRlIGJyYW5jaC4NCj4gDQo+
IFRoYXQncyBub3Qgd2hhdCB5b3VyIHBhdGNoIGRvZXMgYXQgYWxsIDooDQo+IA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
