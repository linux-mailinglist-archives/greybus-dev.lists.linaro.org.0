Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HS2cJn4HNWrLmAYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:22 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332E6A4DEE
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=P+vQuIi0;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B10340AF8
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 09:10:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id 925E83F6BD
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2026 05:36:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1277401f8f.3
        for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2026 22:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781847365; cv=none;
        d=google.com; s=arc-20240605;
        b=h7yW1l626x4O7rFeYkKgys4HhuKZ89OXjd+a3qoCF89LcAYOFLjy9CjZ71qNw1WPmj
         Eu3cLJrnCmQ/486BejcdfRZJMroU2QqC4qsGEf3w9oBPSTB2SlpV7eSEZDoS2q+KJM9c
         mkrdSQwmHQpqmXdGuSIpjLUGRN8ynrohytFPc9PPOYnaXpZbbQde/bmJ4C74ZDe5bRrg
         quLFn1ExCijLnr+n1qHUGTTNdVA9gd4LTqF3Ig+HJaeBl7RNSvh+YAiboxtaGBaD72+l
         4P8V/fc6n60XHxvJ+kB+Zus/bmvdo3DvV++ChjnmUM6+IV7Our5MgwjDqMMKbNtHHusJ
         ltRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xy35Bh2vgCmxOO28PoKalm+RMq1DHI0nOEA4ySWZHrA=;
        fh=3yUwjDNH1iJLt7dHPdAw/SWDKBSRwAuTXFWmgNC7VlY=;
        b=QJMZyM744oqUr3zbrl7akpwfQCzhzUYc24a0VK/G3oK2OQXkGOK7SYqJzAyLrHBZbS
         XZR4cNJ8XxoCQ84Pyyxm9snHzM/d8Oe9XUr/98hQJL/l+Myg9RT3toxqNL4atJk1wD0Z
         AuDjOyqV2gPEk2gpUpUdN5RUFekAOjCVD+s7kw+5phB/msZT7nIxeNXWNpVNaBvD92vS
         vo5MiL1g9JbpFNpgxWuGEn6XqCo7byOgdMluH8MT3CUMBD0qPEdSpCVYONuZQxJMoDmh
         fVMkfcv8It3W2/FcKVF1IIUTT1jAOZ27SD8OBA6Z/W+xWWhTlghtXFzoGeFQb1UdihQR
         rzkw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781847365; x=1782452165; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy35Bh2vgCmxOO28PoKalm+RMq1DHI0nOEA4ySWZHrA=;
        b=P+vQuIi0HGQrk5k46BC3d/DVIGf/W7BUS9Cn7yZm3I0zCVFIPGLsiqCu4IE4ZBoyvC
         Kv5ZVL3UZUoUM7gkS9obPdbkhSa/IghDIeZDOnZ6tZE4x8dfdA+rmHhF5KALMFr5JfoH
         s8SYzfWLHNsxL2uY0B5xWDI9GXFvtIrRAtzuX7Dalc9BiwX+DT5KPqLhzAMLFpDNmCtc
         zk+LL8mz+GDAGdeB1blqYKAcXcb55lFU6VHuh5tHjxmJ8YlWjIVYajbIY1anDaOmLdRI
         WfJPuOdj3WlBcaNiBB2ya3HEHbY+/0CDkzj52aBwHxzAmF4CCCjUP5H5Hq5bMXUBj7HN
         gqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781847365; x=1782452165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy35Bh2vgCmxOO28PoKalm+RMq1DHI0nOEA4ySWZHrA=;
        b=PoYkarp4FUg27ulD1e5Fcf2Sy5B5g/fdnktk5cOkuoiCEYO5QH9atJt7E26ioeYYx4
         orNvg0oNSBTbKvNPrXIO0fnJwArJw6vfQJjudegUH9/iGYQD3ECTvEPPcFTcuIYyPzjF
         4pbYSTVmFlGoeK/WPOV1/0anxSs0XsZBW6pHrk8oY0baY2YZTOkUNXGzjLjwhCHNKLIV
         oOVt/niA/A9NRH+TkJWNYf8bwKHdpfV7j9sggPEyLA5eivZXlSzNEyJ7otnAClov6t67
         rEfNHD5+A2O1Aj/AfBl96A2vSwkQCyl/jUH8gjqBvTws/wQnS8fq8yIlyxo5Y3bBd7K2
         TA7A==
X-Forwarded-Encrypted: i=1; AFNElJ97HNgrnZMMgkeSJU78qW3+wue+K/RhdytGv3FUYPm+OwVsV0+Y/zx18DpHzVK+OZ+XFP2S1I74XbrUIw==@lists.linaro.org
X-Gm-Message-State: AOJu0YyS4tjRvryuNKZxyt5v0FbVg04w0ZwnsPGNyCMwsPY8LLQGsVVx
	vUtFxo8+FJRR+e83Ts3YHfZttaqzyxBO5kYI05w5Ek3cEuszxelvTfWEgWFEvwqkHIljBHgln0s
	pTbw12Zp6Rs9PwNGRIdpQsDp24TloM8w=
X-Gm-Gg: AfdE7cmy3WCsyrBnO1HlFj7wQyTudoK90iDtKq1TDKGJqHdcvlfUg7bTx2drx47b6qO
	0NunD+rhY9TKreJ+4hCxMz7l0JhoKJg3q3/TOLJg8Uzcou6k9oCMxCXQVuEaMM8Tz1F/L9XwkJU
	P6jhAEnOEb0wl6W/Kinxtze8dVNRNKEt2QOQ67vTM7z/BQmR2s8Vwu5NeKsGmpCy4luBU40INgs
	NclxGC8EOoxS8UZDP5EHWe57KasmfPYnc9A/jsawnVo8E2uV2YbB1XgzOdVq4u+kYJEp3aj
X-Received: by 2002:a05:6000:1085:b0:461:fc84:dbee with SMTP id
 ffacd0b85a97d-4650005c5cdmr2905403f8f.16.1781847365298; Thu, 18 Jun 2026
 22:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <178183657058.3862365.12892304946786698397@maoyixie.com> <2026061910-supply-jersey-bb24@gregkh>
In-Reply-To: <2026061910-supply-jersey-bb24@gregkh>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Fri, 19 Jun 2026 13:35:53 +0800
X-Gm-Features: AVVi8Cf-IL_a8SPBYpE2y5wxpbHqbpcxZabaJGxadztouYdjaCji2c-MHSWPzrc
Message-ID: <CAHPEe=GZ+z=1zXUn222ajNjUcDkRMcGjO=JeYNkb3m8a1Qkk+g@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spamd-Bar: ----
X-MailFrom: maoyixie.tju@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: F74JIYNWALZHRBHYZN6ZEFAPO4NFH2VJ
X-Message-ID-Hash: F74JIYNWALZHRBHYZN6ZEFAPO4NFH2VJ
X-Mailman-Approved-At: Fri, 19 Jun 2026 09:10:06 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: staging: greybus: audio: possible out of bounds read in the topology parser
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F74JIYNWALZHRBHYZN6ZEFAPO4NFH2VJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3332E6A4DEE

Thanks Greg, understood, I will keep the device-trust model in mind.

Best,
Maoyi
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
