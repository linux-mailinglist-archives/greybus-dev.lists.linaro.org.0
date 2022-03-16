Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB864DB6FF
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Mar 2022 18:20:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78550401EB
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Mar 2022 17:20:17 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	by lists.linaro.org (Postfix) with ESMTPS id DDBE83ECA3
	for <greybus-dev@lists.linaro.org>; Wed, 16 Mar 2022 17:20:13 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id b16so3181097ioz.3
        for <greybus-dev@lists.linaro.org>; Wed, 16 Mar 2022 10:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZHu31H02wKCvXtiv1u3NIdRpK08igoxIqxArOW7UWyU=;
        b=rZiKWOUZzSymkN+Yq4KLAQtJfCVFW/+Xjr+qxaZLzj8ouud7dnx2bV8X8EQoXNSBx2
         Jhlrltfnf9Yx8RJlkCyRT4kFyK4cEJqv24EFOdqxN3cbCxJ48jvTBJWzifhR4d25wAfW
         usl3o2rg+mhnn35fUhyy5R+9fkAHWaGNLnRVnAXneLbyhzQ5VSaKUF2gvX1vqnXd0Xca
         0OMuhAb5sRnzgy63RV1t7idRVETz9qiNRYDvpDj/HQcRIj9KZMHbP5zyFFEglQgmlEgp
         OCmBzrLw77ObeFFeY8pZgIVP+BwJmPPwcj4BYC9kJD87mZhP0537wG+zyzigtoJ2s+Gb
         kU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZHu31H02wKCvXtiv1u3NIdRpK08igoxIqxArOW7UWyU=;
        b=jB3S8Esjv4wOdjDAi89NFJKvBIU9A1mdqbKGUu7wdasyKA24UvDkIkckmvNnP54VBG
         Iqc17G2pwiyMuhNAB2+Yw+rlClgQkzm5h7nxmhM2nHKBbuJI7/Ku56NDiWLQz+MAes5c
         hCq1tiVYdf9roHDhJz2MRmmAc6Zj+9qDc/mg6wUjeM1WiMxNE9G0vMwHQiEjNfXmMsk2
         KJU6qM/uQyd/O09lm8MJFlxWMj/mK54WR2zv8dHjGC/DpV9ddO9OOjPwSDdfMH0mlN+F
         3BWybd7msaV1zO8U9xFnuF+l/Q0udj4Q/cZMExNjQKHRIcrwvZmMoKtWBFF9aS0DziTe
         adMw==
X-Gm-Message-State: AOAM533TNj6KAOtOZbfSZRA7SzBvdIPzOONMn7fd189fRtY8hizfZ4lX
	5geLXJNnvoF9v1B7L1c9lCtFD4v3
X-Google-Smtp-Source: ABdhPJyZrc94uhg5ZCgdSfeLCguT5+TqrzVKMhco+wETb+0v8fLCrj1k85w00vM79bnWWKdgvyh9eQ==
X-Received: by 2002:a05:6638:24ca:b0:319:d811:b3b5 with SMTP id y10-20020a05663824ca00b00319d811b3b5mr243642jat.235.1647451213288;
        Wed, 16 Mar 2022 10:20:13 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id e18-20020a5d85d2000000b00649254a855fsm1257054ios.26.2022.03.16.10.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 10:20:12 -0700 (PDT)
Message-ID: <a1074d55-c5ee-ced5-b9f7-0e1d023e1fea@linaro.org>
Date: Wed, 16 Mar 2022 12:20:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alex Elder <elder@ieee.org>
References: <1647397285-30061-1-git-send-email-chensong_2000@189.cn>
 <49f18070-0215-8475-907b-487d1e01c15c@ieee.org>
 <20220316162903.kwkfefyznvopvr5g@pengutronix.de>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220316162903.kwkfefyznvopvr5g@pengutronix.de>
Message-ID-Hash: LEPPIJEA64LCJE7GBJTKWQCOFLOHGBHX
X-Message-ID-Hash: LEPPIJEA64LCJE7GBJTKWQCOFLOHGBHX
X-MailFrom: elder@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Song Chen <chensong_2000@189.cn>, johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LEPPIJEA64LCJE7GBJTKWQCOFLOHGBHX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMy8xNi8yMiAxMToyOSBBTSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IE9uIFdlZCwg
TWFyIDE2LCAyMDIyIGF0IDEwOjE0OjMwQU0gLTA1MDAsIEFsZXggRWxkZXIgd3JvdGU6DQo+PiBP
biAzLzE1LzIyIDk6MjEgUE0sIFNvbmcgQ2hlbiB3cm90ZToNCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
Yw0KPj4+IGluZGV4IDg5MWE2YTY3MjM3OC4uM2FkZDMwMzI2NzhiIDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQo+Pj4gKysrIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvcHdtLmMNCj4+PiBAQCAtMjA0LDQzICsyMDQsNTQgQEAgc3RhdGljIHZvaWQgZ2Jf
cHdtX2ZyZWUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQ0K
Pj4+ICAgIAlnYl9wd21fZGVhY3RpdmF0ZV9vcGVyYXRpb24ocHdtYywgcHdtLT5od3B3bSk7DQo+
Pj4gICAgfQ0KPj4+IC1zdGF0aWMgaW50IGdiX3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpj
aGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLA0KPj4+IC0JCQkgaW50IGR1dHlfbnMsIGludCBw
ZXJpb2RfbnMpDQo+Pj4gK3N0YXRpYyBpbnQgZ2JfcHdtX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAq
Y2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwNCj4+PiArCQkJY29uc3Qgc3RydWN0IHB3bV9z
dGF0ZSAqc3RhdGUpDQo+Pj4gICAgew0KPj4+ICsJaW50IGVycjsNCj4+PiArCWJvb2wgZW5hYmxl
ZCA9IHB3bS0+c3RhdGUuZW5hYmxlZDsNCj4+PiArCXU2NCBwZXJpb2QgPSBzdGF0ZS0+cGVyaW9k
Ow0KPj4+ICsJdTY0IGR1dHlfY3ljbGUgPSBzdGF0ZS0+ZHV0eV9jeWNsZTsNCj4+DQo+PiBUaGUg
dXNlIG9mIGxvY2FsIHZhcmlhYmxlcyBoZXJlIGlzIGluY29uc2lzdGVudCwgYW5kIHRoYXQNCj4+
IGNhbiBiZSBjb25mdXNpbmcuICBTcGVjaWZpY2FsbHksIHRoZSAiZW5hYmxlZCIgdmFyaWFibGUN
Cj4+IHJlcHJlc2VudHMgdGhlICpjdXJyZW50KiBzdGF0ZSwgd2hpbGUgdGhlICJwZXJpb2QiIGFu
ZA0KPj4gImR1dHlfY3ljbGUiIHZhcmlhYmxlcyByZXByZXNlbnQgdGhlICpkZXNpcmVkKiBzdGF0
ZS4gIFRvDQo+PiBhdm9pZCBjb25mdXNpb24sIGlmIHlvdSdyZSBnb2luZyB0byB1c2UgbG9jYWwg
dmFyaWFibGVzDQo+PiBsaWtlIHRoYXQsIHRoZXkgc2hvdWxkIGFsbCByZXByZXNlbnQgKmVpdGhl
ciogdGhlIGN1cnJlbnQNCj4+IHN0YXRlICpvciogdGhlIG5ldyBzdGF0ZS4gIFBsZWFzZSB1cGRh
dGUgeW91ciBwYXRjaCB0bw0KPj4gZG8gb25lIG9yIHRoZSBvdGhlci4NCj4gDQo+IElNSE8gdGhh
dCBpdCBvdmVybHkgcGlja3kuIEknbSBvayB3aXRoIHRoZSB1c2FnZSBhcyBpcy4NCg0KSSBzZWUg
dGhlICJlbmFibGVkIiBmbGFnIGlzIHVzZWQgaW4gYSB3YXkgdGhhdCBJIGRpZG4ndA0Kbm90aWNl
IGJlZm9yZS4gIENoYW5naW5nIGl0cyBuYW1lIHRvICJkaXNhYmxlZCIgKHRvIG1lYW4NCiJ3ZSBo
YXZlIGRpc2FibGVkIHRoZSBkZXZpY2Ugd2l0aGluIHRoaXMgZnVuY3Rpb24gYWxyZWFkeSIpDQp3
b3VsZCBhbGxvdyBpdCB0byBiZSB1c2VkIGluIHRoZSBzYW1lIHdheSwgYnV0IHdvdWxkIG1ha2UN
Cml0IG1vcmUgb2J2aW91cyBpdCdzIG5vdCBqdXN0IGEgY29weSBvZiAib2xkIiBkZXZpY2Ugc3Rh
dGUuDQoNCj4+PiAgICAJc3RydWN0IGdiX3B3bV9jaGlwICpwd21jID0gcHdtX2NoaXBfdG9fZ2Jf
cHdtX2NoaXAoY2hpcCk7DQo+Pj4gLQlyZXR1cm4gZ2JfcHdtX2NvbmZpZ19vcGVyYXRpb24ocHdt
YywgcHdtLT5od3B3bSwgZHV0eV9ucywgcGVyaW9kX25zKTsNCj4+PiAtfTsNCj4+PiArCS8qIHNl
dCBwb2xhcml0eSAqLw0KPj4+ICsJaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBwd20tPnN0YXRlLnBv
bGFyaXR5KSB7DQo+Pj4gKwkJaWYgKGVuYWJsZWQpIHsNCj4+PiArCQkJZ2JfcHdtX2Rpc2FibGVf
b3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20pOw0KPj4+ICsJCQllbmFibGVkID0gZmFsc2U7DQo+
Pj4gKwkJfQ0KPj4+ICsJCWVyciA9IGdiX3B3bV9zZXRfcG9sYXJpdHlfb3BlcmF0aW9uKHB3bWMs
IHB3bS0+aHdwd20sIHN0YXRlLT5wb2xhcml0eSk7DQo+Pj4gKwkJaWYgKGVycikNCj4+PiArCQkJ
cmV0dXJuIGVycjsNCj4+PiArCX0NCj4+PiAtc3RhdGljIGludCBnYl9wd21fc2V0X3BvbGFyaXR5
KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwNCj4+PiAtCQkJ
ICAgICAgIGVudW0gcHdtX3BvbGFyaXR5IHBvbGFyaXR5KQ0KPj4+IC17DQo+Pj4gLQlzdHJ1Y3Qg
Z2JfcHdtX2NoaXAgKnB3bWMgPSBwd21fY2hpcF90b19nYl9wd21fY2hpcChjaGlwKTsNCj4+PiAr
CWlmICghc3RhdGUtPmVuYWJsZWQpIHsNCj4+PiArCQlpZiAoZW5hYmxlZCkNCj4+PiArCQkJZ2Jf
cHdtX2Rpc2FibGVfb3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20pOw0KPj4+ICsJCXJldHVybiAw
Ow0KPj4NCj4+IElmIHlvdSBhcmUgZGlzYWJsaW5nIHRoZSBkZXZpY2UsIHlvdSByZXR1cm4gd2l0
aG91dCB1cGRhdGluZyB0aGUNCj4+IHBlcmlvZCBhbmQgZHV0eSBjeWNsZS4gIEJ1dCB5b3UgKmRv
KiBzZXQgcG9sYXJpdHkuICBJcyB0aGF0DQo+PiByZXF1aXJlZCBieSB0aGUgUFdNIEFQST8gIChJ
IGRvbid0IGFjdHVhbGx5IGtub3cuKSAgT3IgY2FuIHRoZQ0KPj4gcG9sYXJpdHkgc2V0dGluZyBi
ZSBzaW1wbHkgaWdub3JlZCBhcyB3ZWxsIGlmIHRoZSBuZXcgc3RhdGUgaXMNCj4+IGRpc2FibGVk
Pw0KPiANCj4gQWxsIGlzIHdlbGwgaGVyZS4gQSBkaXNhYmxlZCBQV00gaXMgZXhwZWN0ZWQgdG8g
ZW1pdCB0aGUgaW5hY3RpdmUgbGV2ZWwuDQo+IFNvIHBvbGFyaXR5IG1hdHRlcnMsIGR1dHkgYW5k
IHBlcmlvZCBkb24ndC4NCg0KVGhhbmtzIGZvciBjbGFyaWZ5aW5nIHRoYXQuICBJIGRpZCBub3Qg
a25vdyB3aGF0IHdhcyBleHBlY3RlZC4NCg0KPj4gQWxzbywgaWYgdGhlIHBvbGFyaXR5IGNoYW5n
ZWQsIHRoZSBkZXZpY2Ugd2lsbCBoYXZlIGFscmVhZHkgYmVlbg0KPj4gZGlzYWJsZWQgYWJvdmUs
IHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBkbyBzbyBhZ2FpbiAoYW5kIHBlcmhhcHMNCj4+IGl0IG1p
Z2h0IGJlIGEgYmFkIHRoaW5nIHRvIGRvIHR3aWNlPykuDQo+IA0KPiBUaGF0IHdvbid0IGhhcHBl
biwgYmVjYXVzZSBpZiB0aGUgZGV2aWNlIHdhcyBkaXNhYmxlZCBmb3IgdGhlIHBvbGFyaXR5DQo+
IGNoYW5nZSwgZW5hYmxlZCA9IGZhbHNlLiBJbiBmYWN0IHRoYXQgaXMgdGhlIHB1cnBvc2Ugb2Yg
dGhlIGxvY2FsDQo+IHZhcmlhYmxlLg0KDQpOb3cgSSBzZWUsIHllcywgdGhlIGxvY2FsIHZhcmlh
YmxlIGdldHMgY2hhbmdlZCB3aGVuIHRoZQ0KZGlzYWJsZSBvY2N1cnJlZCBhYm92ZS4NCg0KPj4+
ICsJfQ0KPj4+IC0JcmV0dXJuIGdiX3B3bV9zZXRfcG9sYXJpdHlfb3BlcmF0aW9uKHB3bWMsIHB3
bS0+aHdwd20sIHBvbGFyaXR5KTsNCj4+PiAtfTsNCj4+DQo+PiBTaW5jZSB5b3UncmUgY2xhbXBp
bmcgdGhlIHZhbHVlcyB0byAzMiBiaXRzIGhlcmUsIHlvdXIgY29tbWVudA0KPj4gc2hvdWxkIGV4
cGxhaW4gd2h5IChiZWNhdXNlIEdyZXlidXMgdXNlcyAzMi1iaXQgdmFsdWVzIGhlcmUsDQo+PiB3
aGlsZSB0aGUgQVBJIHN1cHBvcnRzIDY0IGJpdCB2YWx1ZXMpLiAgVGhhdCB3b3VsZCBiZSBhIG11
Y2gNCj4+IG1vcmUgdXNlZnVsIHBpZWNlIG9mIGluZm9ybWF0aW9uIHRoYW4gInNldCBwZXJpb2Qg
YW5kIGR1dHkgY3ljbGUiLg0KPj4NCj4+PiArCS8qIHNldCBwZXJpb2QgYW5kIGR1dHkgY3ljbGUq
Lw0KPj4NCj4+IEluY2x1ZGUgYSBzcGFjZSBiZWZvcmUgIiovIiBpbiB5b3VyIGNvbW1lbnRzLg0K
PiANCj4gYWNrDQo+IA0KPj4+ICsJaWYgKHBlcmlvZCA+IFUzMl9NQVgpDQo+Pj4gKwkJcGVyaW9k
ID0gVTMyX01BWDsNCj4+PiAtc3RhdGljIGludCBnYl9wd21fZW5hYmxlKHN0cnVjdCBwd21fY2hp
cCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkNCj4+PiAtew0KPj4+IC0Jc3RydWN0IGdi
X3B3bV9jaGlwICpwd21jID0gcHdtX2NoaXBfdG9fZ2JfcHdtX2NoaXAoY2hpcCk7DQo+Pj4gKwlp
ZiAoZHV0eV9jeWNsZSA+IHBlcmlvZCkNCj4+PiArCQlkdXR5X2N5Y2xlID0gcGVyaW9kOw0KPj4+
IC0JcmV0dXJuIGdiX3B3bV9lbmFibGVfb3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20pOw0KPj4+
IC19Ow0KPj4+ICsJZXJyID0gZ2JfcHdtX2NvbmZpZ19vcGVyYXRpb24ocHdtYywgcHdtLT5od3B3
bSwgZHV0eV9jeWNsZSwgcGVyaW9kKTsNCj4+PiArCWlmIChlcnIpDQo+Pj4gKwkJcmV0dXJuIGVy
cjsNCj4+DQo+PiBXaGF0IGlmIHRoZSBuZXcgc3RhdGUgc2V0IHVzYWdlX3Bvd2VyIHRvIHRydWU/
ICBJdCB3b3VsZA0KPj4gYmUgaWdub3JlZCBoZXJlLiAgSXMgaXQgT0sgdG8gc2lsZW50bHkgaWdu
b3JlIGl0PyAgRXZlbg0KPj4gaWYgaXQgaXMsIGEgY29tbWVudCBhYm91dCB0aGF0IHdvdWxkIGJl
IGdvb2QgdG8gc2VlLCBzbw0KPj4gd2Uga25vdyBpdCdzIGludGVudGlvbmFsLg0KPiANCj4gaWdu
b3JpbmcgdXNhZ2VfcG93ZXIgaXMgT0suIEFsbCBidXQgYSBzaW5nbGUgZHJpdmVyIGRvIGl0IHRo
YXQgd2F5Lg0KDQpJIGRvbid0IGFjdHVhbGx5IHNlZSBhbnl0aGluZyB0aGF0IHNldHMgdXNhZ2Vf
cG93ZXIgdG8gdHJ1ZSwNCmFsdGhvdWdoICJwd20tcGNhOTY4NS5jIiB0ZXN0cyBpdHMgdmFsdWUu
DQoNCkkgZ3Vlc3MgaXQncyBhbiBhZHZpc29yeSBwYXJhbWV0ZXIgdGhhdCdzIHBhc3NlZCB0byB0
aGUgYXBwbHkNCmNhbGxiYWNrIGZ1bmN0aW9uLiAgSXQncyBkZXNjcmliZWQgYXMgb3B0aW9uYWws
IGJ1dC0tbm90IGJlaW5nDQphICJQV00gcGVyc29uIi0tdGhpcyBpc24ndCBvYnZpb3VzIHRvIG1l
LiAgTWF5YmUgdGhlIGNvbW1lbnRzDQpkZXNjcmliaW5nIHRoZSBmaWVsZCBvciB0aGUgYXBwbHkg
Y2FsbGJhY2sgY291bGQgZGVmaW5lIHRoZQ0Kc2VtYW50aWNzIGEgbGl0dGxlIGJldHRlciBhdCBz
b21lIHBvaW50Lg0KDQoJCQkJCS1BbGV4DQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4g
DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
Zw0KPiBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2
ZUBsaXN0cy5saW5hcm8ub3JnCg==
