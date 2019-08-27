Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBE29EB0D
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 16:31:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94CDC60EFF
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 14:31:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 89D0961731; Tue, 27 Aug 2019 14:31:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B4B061813;
	Tue, 27 Aug 2019 14:31:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4F1DC607CE
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 14:31:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 37B316184D; Tue, 27 Aug 2019 14:31:00 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by lists.linaro.org (Postfix) with ESMTPS id 5B924607CE
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 14:30:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y8so19023429wrn.10
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 07:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=p83Skcb28sZgDYz2+LArg9KtzzoTO/pqlqaaYMaERPA=;
 b=go9wRbiWAaRTUGUcS5IRV6rn/UffkfWpmhRaiDbvGPEXR3Kbo23QIYOG9yHJwlEhp+
 QrUML84Dr77txGoI+NtQMBj6dVw7OJKEdagSvO1Q4ogonnRvu8bqnxTPoJp1DrCTCCM8
 JL7LGNmr1ZmJUzhJITrWO+ED2VeUsAkxxfXdjy8GNMPLv6Nk04CLb40zPz7k/deesR2v
 gGW0d+u6xaIFldpYUcrVq1ei69YFQ26dX3FkfO5GW47BNO4JXXszzhBBYU/SjcgkCcWH
 gBiYG8NE/+08DBuKK5Jlls8dx0OGKEjQ6dOYhUFU3NT/QPoQCjsI8BsHCNlHZMYgDmsd
 fR9g==
X-Gm-Message-State: APjAAAXEua7h2QXOP75xCvo1rH9+Sn2avytYIahBH4IWtwZGqmBKzgTf
 XqrWxq85z1MH6UWFpCWv6Pg=
X-Google-Smtp-Source: APXvYqxBtyc6svJ8Xu3LT43sJMkaWOZO8khDahH9sqRD8n2Bz4iEEvBHOI9aCz41C2J6FWOFJiQnnA==
X-Received: by 2002:adf:e801:: with SMTP id o1mr30684004wrm.45.1566916228410; 
 Tue, 27 Aug 2019 07:30:28 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id w13sm40657283wre.44.2019.08.27.07.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 07:30:27 -0700 (PDT)
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190827133611.GE23584@kadam> <20190827134557.GA25038@kroah.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: driverdev-devel@linuxdriverproject.org
In-reply-to: <20190827134557.GA25038@kroah.com>
Date: Tue, 27 Aug 2019 15:30:21 +0100
Message-ID: <m3d0gqisua.fsf@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH 0/9] staging: move greybus core out of
	staging
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

SGksCk9uIFR1ZSAyNyBBdWcgMjAxOSBhdCAxNDo0NSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3Rl
Ogo+IE9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDA0OjM2OjExUE0gKzAzMDAsIERhbiBDYXJwZW50
ZXIgd3JvdGU6Cj4+IEkgY2FuJ3QgY29tcGlsZSBncmV5YnVzIHNvIGl0J3MgaGFyZCB0byBydW4g
U21hdGNoIG9uIGl0Li4uICBJIGhhdmUgYQo+PiBTbWF0Y2ggdGhpbmcgd2hpY2ggaWdub3JlcyBt
aXNzaW5nIGluY2x1ZGVzIGFuZCBqdXN0IHRyaWVzIGl0cyBiZXN0Lgo+PiBJdCBtb3N0bHkgZ2Vu
ZXJhdGVzIGdhcmJhZ2Ugb3V0cHV0IGJ1dCBhIGNvdXBsZSBvZiB0aGVzZSBsb29rIGxpa2UKPj4g
cG90ZW50aWFsIGlzc3VlczoKPgo+IFdoeSBjYW4ndCB5b3UgY29tcGlsZSB0aGUgY29kZT8KPgoK
SSB0aGluayB3ZSBhcmUgbWlzc2luZyBpbmNsdWRlcyBpbiBzb21lIG9mIHRoZQpncmV5YnVzIGhl
YWRlciBmaWxlcy4KCj4KPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvb3BlcmF0aW9uLmM6Mzc5
IGdiX29wZXJhdGlvbl9tZXNzYWdlX2FsbG9jKCkgd2FybjogY2hlY2sgJ21lc3NhZ2Vfc2l6ZScg
Zm9yIGludGVnZXIgb3ZlcmZsb3dzICdremFsbG9jKCknCj4KPiBUaGF0IHNob3VsZCBiZSBjaGVj
a2VkIG9uIGxpbmUgMzY4LCByaWdodD8KPgo+PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdo
dC5jOjEyNTYgZ2JfbGlnaHRzX3JlcXVlc3RfaGFuZGxlcigpIHdhcm46ICdsaWdodC0+Y2hhbm5l
bHMnIGRvdWJsZSBmcmVlZAo+PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jOjEyNTYg
Z2JfbGlnaHRzX3JlcXVlc3RfaGFuZGxlcigpIHdhcm46ICdsaWdodC0+bmFtZScgZG91YmxlIGZy
ZWVkCj4KPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyB3YXJuaW5nLCBob3cgYXJlIHRoZXNlIHBv
dGVudGlhbGx5IGRvdWJsZSBmcmVlZD8KPgo+IEFuZCB0aGUgbGlnaHQuYyBmaWxlIGlzbid0IG1v
dmluZyBvdXQgb2YgZHJpdmVycy9zdGFnaW5nLyBqdXN0IHlldCA6KQo+CgpJIHdpbGwgdGFrZSBh
IGxvb2sgYXQgdGhpcyBhbHNvLgoKQ2hlZXJzLAogICBSdWkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
