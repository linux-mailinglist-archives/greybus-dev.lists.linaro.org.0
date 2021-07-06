Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFF3BF694
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:57:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A8A316694D
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:57:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9C54066760; Thu,  8 Jul 2021 07:56:24 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE3FC66961;
	Thu,  8 Jul 2021 07:56:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E999C603AB
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:42:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E40FF60B5A; Tue,  6 Jul 2021 11:42:38 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by lists.linaro.org (Postfix) with ESMTPS id D55BF603AB
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:42:36 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id ch27so1170226edb.10
 for <greybus-dev@lists.linaro.org>; Tue, 06 Jul 2021 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CDGtQ2yb8IShQ7cIRYFiJmp1Uu5BANeA/6Jg/xILJy0=;
 b=TwRJy6+J3urIn/EOHkX70XQHrPpIXFIOoiquz6eJSwyU/SQIQ4dADKORnRQAYcVLDd
 bGmCH+O3vZ/zwAN03+xnrlCOWn/T/Pz6KfPYlHzOgGXWb72eEAEAjVLMxY3sV52LOQiu
 4sMepvP8f2M/NuGTEEUpcS9djTSXyNUocbOOHuCxDZ/swc4Yj2krBjOK18+xBOWwYw7y
 O/LcWjnu0kdZ4pmyv7jFfFo0qSdeTOdmtP2CciCXwcdnQ5FYkYueWY1vZLSQqxLbXVdx
 xHWyXJmiVDLrlTvE9QGQSNArUJUGdY04ySHX3mfxNurDFI1sFLhNw1IKyh/ZzycJEC6f
 piBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CDGtQ2yb8IShQ7cIRYFiJmp1Uu5BANeA/6Jg/xILJy0=;
 b=UIKtYIiz7yLdsaaXAXjuFc9q6zlP3bugBLZKFGHNJEMRZwJ+h+iN091+oArgfADRg6
 VyRAuFUTgiXwLmlTLtOlUfii4/Km08XyCeLBbugQU6QxfEGyO6l6T7q1vkoq6atSCIaH
 GwG9L4Pm0kutEOUiK3vU8EfgqrYJ0bsOYzFdgY+KkKOkFMfJtM0laQF7i3ZGJNTOnxT8
 0gbJHowsBfiAtr6ulxtI2SN2r73I/6KVF9/f+urrns9Oe/po/T1Pj+a172RSE61HvF8p
 By0HDpZ/egg2VzKcrGwgZQVyuTyj5mrEL7aMUXZN6UYhCCMqYIALPzmnRyAGYXQWIk+A
 Hq+Q==
X-Gm-Message-State: AOAM531rP1KbSbE4+/IcHUtjG7MOn0VawX5qOAHZDH41ZBFbsTS20YXU
 yc6vBsKPVWALGFcFOSaarFo=
X-Google-Smtp-Source: ABdhPJwOR9RYbuFI1V8zYqZEcawlLdGKboqfR9DJ6TrIpurxtzPOHwaABH2lGpOOBvACTZh8ZOEU1A==
X-Received: by 2002:a05:6402:1c06:: with SMTP id
 ck6mr22330893edb.287.1625571755735; 
 Tue, 06 Jul 2021 04:42:35 -0700 (PDT)
Received: from [192.168.2.202] (pd9e5a48a.dip0.t-ipconnect.de.
 [217.229.164.138])
 by smtp.gmail.com with ESMTPSA id eb9sm5646083ejc.32.2021.07.06.04.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 04:42:35 -0700 (PDT)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <07c08230-6c71-2a73-c89f-05b9b5de78ab@gmail.com>
Date: Tue, 6 Jul 2021 13:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:55:56 +0000
Subject: Re: [greybus-dev] [PATCH] bus: Make remove callback return void
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Alex Elder <elder@kernel.org>,
 kvm@vger.kernel.org, nvdimm@lists.linux.dev, linux-mmc@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-cxl@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 target-devel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i3c@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>,
 Rob Herring <robh@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, linux-scsi@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, linux-acpi@vger.kernel.org,
 Andy Gross <agross@kernel.org>, industrypack-devel@lists.sourceforge.net,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-sunxi@lists.linux.dev, Len Brown <lenb@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Jiri Kosina <jikos@kernel.org>,
 Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 xen-devel@lists.xenproject.org, Bjorn Helgaas <bhelgaas@google.com>,
 Mark Gross <mgross@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 Johannes Thumshirn <morbidrsa@gmail.com>, linux-parisc@vger.kernel.org,
 greybus-dev@lists.linaro.org, Stephen Boyd <sboyd@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-ntb@googlegroups.com, linux-media@vger.kernel.org,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNy82LzIxIDExOjUwIEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgZHJpdmVy
IGNvcmUgaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVzZSB0
aGVyZQo+IGlzIG9ubHkgbGl0dGxlIGl0IGNhbiBkbyB3aGVuIGEgZGV2aWNlIGRpc2FwcGVhcnMu
Cj4gCj4gVGhpcyBpcyB0aGUgZmluYWwgYml0IG9mIGEgbG9uZyBsYXN0aW5nIGNsZWFudXAgcXVl
c3Qgd2hlcmUgc2V2ZXJhbAo+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJuIHZv
aWQgZnJvbSB0aGVpciByZW1vdmUgY2FsbGJhY2suCj4gQWRkaXRpb25hbGx5IHNvbWUgcmVzb3Vy
Y2UgbGVha3Mgd2VyZSBmaXhlZCB0aGF0IHdlcmUgY2F1c2VkIGJ5IGRyaXZlcnMKPiByZXR1cm5p
bmcgYW4gZXJyb3IgY29kZSBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZHJpdmVyIHdvbid0
IGdvCj4gYXdheS4KPiAKPiBXaXRoIHN0cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmluZyB2
b2lkIGl0J3MgcHJldmVudGVkIHRoYXQgbmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1cm4g
YW4gaWdub3JlZCBlcnJvciBjb2RlIGFuZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3JvbmcgZXhw
ZWN0YXRpb25zIGZvciBkcml2ZXIgYXV0aG9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKPiAgIGRyaXZlcnMv
cGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL2J1cy5jIHwgNCArLS0tCgpBY2tlZC1ieTogTWF4
aW1pbGlhbiBMdXogPGx1em1heGltaWxpYW5AZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=
