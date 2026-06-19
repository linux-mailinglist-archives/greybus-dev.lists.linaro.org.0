Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RKt+LXoHNWrKmAYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 678756A4DEB
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=nGJH5qib;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8737D40AD5
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 09:10:17 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id 84BC540976
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2026 02:36:15 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1464274b3a.2
        for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2026 19:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781836574; x=1782441374; darn=lists.linaro.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHqEORpslI1FT63Z8ElNeWMRAg3ec3xTp1z9QP8/uho=;
        b=nGJH5qibSBslb3inXg5bogUACAuzaJcTF1+Q1jQXv8y+heUiUi9KAaKA3TwiAk4lZc
         SB5N8c2T3Nb4l2+MslkR5+gf2ZRWIsKSUxwbQTlpoLOQ+Wd4oDrteWBKHkEf4nVSJWpv
         koXchVBpaIzXGB45LE+BepWR5WNnenJQebAtObSpBtTnVvVTH5vnDQDu39BkP8phyPZ5
         lj7b4lmOHTPmhO3v3g0S0stbdwjMF2ac18ivrUdTf0lAtoC4oByfY4jiqudUHBGE32Yg
         ZkEmYvAWqMR3FP+/5kzjPmzO6S29KZXJk0VpefMyDcga9VfFgEq7pCMthBuv+wVjDTm/
         7yyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781836574; x=1782441374;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHqEORpslI1FT63Z8ElNeWMRAg3ec3xTp1z9QP8/uho=;
        b=XJELZqjQZhStsfzf7jdRLfKxkJmw7RaAiuvolSVq7wgpikXkC6305QD1lxscyjeIgJ
         7dv7Uwa309jGTgEZaaz6EwhYxEMlbYGTE0rfmEGLQVfXpF86fHtixhBpdxQUWh1ItsKO
         GKVwGcvM0ffY9hu/M5qIjCkiKf//pEJJygd9wFrTewHTlHiMd7hB0Sc5+qqr8sCceYvU
         U2wVHcEW1mDtBApBOSnu9qrhi8tDckimAJ+netLFKDcamoehV6ReyB2DJ1AA1lhuaYPK
         n1kg/PXh4HhFGeUWKPm5uDwmNwDqZ9wcCnQur+bZv7J0AmDzcsxJvEUvXF+gPda9hY7c
         TJ0g==
X-Forwarded-Encrypted: i=1; AFNElJ/AbUl/0E1NAxGsVk/nTWLOuYTV2MJdoC5BofiNYeRD4np8bJ1kFuQZT6bBKVI+aze6R+yPQ/1/YBSsMw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwNN7GYN0oByDzc3/jkx6GsXM/Pm6S30lAomoJpS8nM2VMl0+hk
	4ZrIcuIRO7hOxqwAxakvJW+QAAHz2fc5rrYwRSYVb9mQ6D68MsryB5g/
X-Gm-Gg: AfdE7cmYAyxm2WZlUwEtOWe2i7Pu0d6W7il3D19A0BLGH4LufC0m+GXLsdGfei7yCz9
	+3lp2XXV1VqALykajuVGxwKJIWA9EciciUyGgAXr88roLkOWbsz7WVmV+z5VIV/aXWWZizU71Fm
	ApTxQZ8Te/kvQV8dR7pcMxNeMa2Z+LWhtL0eru7epcgrehnGi4yLUD/Omq74VgfecldFVBkKY4x
	XWSx0U3ncoZo0bVvfWr9+wYB+HGfGaYgRkirdFDpMTxpl5bikzOEc465MABuMeBUlTGYq+ewJ+f
	ZLFggnX8x/VRiac4FyTZD4uFUyI+NsO0Hf+Tmz2uIeiDloalh1eS8Iic1X0JkMQSjUREH5VLR3t
	Rfs3+SNuJ/qw0QjVS9hvFAz4rMTulVZOwGDvqSZw0lqTCQK4hTyD1HnGnPzMkdpZ9/p5GR6BgDJ
	EvudTY/qukndak53393TetOZb6yinvVyzr3X8xUg==
X-Received: by 2002:a05:6a00:4f96:b0:842:77ab:35df with SMTP id d2e1a72fcca58-8455079fd98mr1677838b3a.11.1781836574505;
        Thu, 18 Jun 2026 19:36:14 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845537fa674sm530464b3a.33.2026.06.18.19.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:36:13 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: 
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>
Date: Fri, 19 Jun 2026 10:36:10 +0800
Message-ID: <178183657058.3862365.12892304946786698397@maoyixie.com>
MIME-Version: 1.0
X-Spamd-Bar: ----
X-MailFrom: maoyixie.tju@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: B4DPD5U5WUWV6YBYIRLM4X3T422KPQOZ
X-Message-ID-Hash: B4DPD5U5WUWV6YBYIRLM4X3T422KPQOZ
X-Mailman-Approved-At: Fri, 19 Jun 2026 09:10:06 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev]  staging: greybus: audio: possible out of bounds read in the topology parser
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B4DPD5U5WUWV6YBYIRLM4X3T422KPQOZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,maoyixie.com:url,maoyixie.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 678756A4DEB

Hi all,

I think the Greybus audio topology parser in
drivers/staging/greybus/audio_topology.c can read past the topology blob
when a module reports inconsistent counts. I would appreciate it if you
could take a look.

gb_audio_gb_get_topology() allocates the blob to a device-reported u16 size
and only checks that it is at least sizeof(struct gb_audio_topology).

	size = le16_to_cpu(size_resp.size);
	if (size < sizeof(*topo))
		return -ENODATA;
	topo = kzalloc(size, GFP_KERNEL);

After that the parser trusts the interior fields. gb_generate_enum_strings()
walks one C string per item with no end pointer.

	items = le32_to_cpu(gbenum->items);
	for (i = 0; i < items; i++) {
		strings[i] = data;
		while (*data != '\0')
			data++;
		data++;
	}

items is a device le32 and there is no guarantee the blob holds that many
NUL terminated strings, so the while loop runs off the end of the
allocation. The same pattern is in gbaudio_tplg_process_header(), which
derives the control, widget and route offsets by adding device le32 block
sizes with no check against the end of the blob, and in the csize cursor
advance in gbaudio_tplg_process_kcontrols() and gbaudio_tplg_create_widget().

The whole blob is device data parsed on the probe path with no privilege
needed. The attacker here is a malicious or faulty Greybus audio module on
the interface.

I reproduced the enum string walk under KASAN on 7.1-rc7. A blob with one
NUL per item stays inside the allocation. A blob with missing terminators
makes KASAN report a slab out of bounds read past the buffer.

I have a partial fix that passes the buffer end into the enum walk and stops
on overrun. A complete fix also needs to bound the header offsets and the
csize advances against the allocation size, so I wanted to ask before
sending a series.

Does this look like a real bug to you? If it does I am happy to send a
proper patch. The parser was added in c8e6336bb3f8 ("greybus: audio: Add
topology parser for GB codec"), which I think is the right Fixes tag.

Thanks,
Maoyi
https://maoyixie.com/
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
