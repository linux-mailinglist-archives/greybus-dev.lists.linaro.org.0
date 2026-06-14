Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mipZBW3fL2ojIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:05 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA3685A9F
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Xf+MnZ4x;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F1F8C40A6B
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:18:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	by lists.linaro.org (Postfix) with ESMTPS id 9BED23F96F
	for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 15:44:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso21775745e9.1
        for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451845; x=1782056645; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Oz6PIFZNPBpek1l1gIJRIoH1qb80MU2GHgEXhoPMto=;
        b=Xf+MnZ4xahsUqmfl4I/+GIsf5JY3p9L/9z+LlCSe0FNW1AYE275JlA6acpCCtTHhq2
         sbiLkskVfemUlL8Svt0hxD68LkR8xGP4e1WD4Cilg0fx6dMBc4G3qm+Du10jiabL6D2K
         Z99QK/ReB2h7+/kKa7DFLgiADr8CnOttXRo9qnsJr4++NetsSJtUxjFp1Mt9w7OxXbPG
         kbrEOSyeqmWi4I7hcqE+tv06Q+KSx3xDO4E1Ka8HRmGjMOKw+z7zqXbaDOA/S8yOgFOd
         kCVua2KhCogkeZdk4J2HEXDPZxdgq7M3HVABJPaw4WNqjrdP4PnUOeA4Am4+BpzfiyJU
         1eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451845; x=1782056645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Oz6PIFZNPBpek1l1gIJRIoH1qb80MU2GHgEXhoPMto=;
        b=cYhb0F6vlx5Qgsf4vTpDh/Ww+41LxS5sJp3F3cfyB6UrkRnGvIWooTbz/7yYisS2Da
         kRUufyXbD0XY4wEqBdI761jc3O0K0SlV5RTA7JBlPz/tGXd8KdhuV35saUK3PhSzIKcg
         v3cqMoDRDjudI0sGKhEtcWiau0pY98xHj/ni65km5CnjYxqYQILmnyU96Bm89ZzeljVl
         kCGf85gxFtY8rayPg4F+5hcksO0KqxwmbJK1Xb6auXC2tpL18Sj4uYmLnWS/BVHn1AxM
         YhwBfNacTo407qiCdgHGap8GQZeuOHOtBVjViWtwEcLiXmwt8TnpzJYV9mEbR7ZZiYzC
         absw==
X-Forwarded-Encrypted: i=1; AFNElJ+T2oqm1/l04hvxx+7bDrP0OftMnOxQ5gMihiq0igPvQRrduyMlesIajxwT5gx1ZagXeJ3bXAAwGWGWSw==@lists.linaro.org
X-Gm-Message-State: AOJu0YyW86N811oQcMc10tpvTdub/Glg/13vGGzQNzUAo6SldQrOJIrj
	wQfnuqIRYswJUGotq0rxD5zFZma3pplf2j2FPwSCPqAOg1AaTcpb/7om
X-Gm-Gg: Acq92OFnebj/slpY8pUCjlmbnVyF4RU/HTtjDEOJY7sY+8Ece9rM+CiD0octQEgsMbN
	8YChO50K3eJwKoCp9cExpifdmTu85a1+BEDKyNTBrlW4qisL9+AgI1Vun94y+/lnlziNWRzh3Tp
	Mmcw3rUKmVdeYRnHantdLQ0Cs763Bz2n0Toso9c3SBWve24nt4tfXhXgV+4xYf7HBpvED+zSyLo
	GZnEQuT7ctkzaDuNrxvFHCb9xKBlbf5uPb3yNCPhzaxCzaPtGQB4VBArONwraDUxwHHpUb+1ig2
	foBXQQnS6H00/nq4/dqFAPkCPn379YczYQmQBnWXm90rltnEIGksd7NNK7jJdoLsPf1LJjrb/dU
	nJQ9JKqCVP/sCKy9mJCyu8LvrAXvI/3vUz6OCljeigzCrX7s4S/wQ5ksHjiIlHzid6Yc2Tn9f12
	JE7DCs2mlJYtAQg+dHtFZeIY4wkoabw+tQ1KNMTIYkrNx8gN4Eh64V8cHc
X-Received: by 2002:a7b:c385:0:b0:491:89c2:bf3e with SMTP id 5b1f17b1804b1-492200e8734mr65930635e9.30.1781451845454;
        Sun, 14 Jun 2026 08:44:05 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922031b7d2sm184237135e9.5.2026.06.14.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:44:05 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 14 Jun 2026 18:43:27 +0300
Message-ID: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: abdelnasserhussein11@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZME5MUZ2FOTHNSMLUGNGGGHT3JN7CVO3
X-Message-ID-Hash: ZME5MUZ2FOTHNSMLUGNGGGHT3JN7CVO3
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:31 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/2] staging: greybus: audio: cleanups for gbaudio_module_update
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZME5MUZ2FOTHNSMLUGNGGGHT3JN7CVO3/>
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdelnasserhussein11@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4AA3685A9F

This patch series addresses two separate issues in gbaudio_module_update()
that were previously combined in v2:

1. Fixes an improper check of the sscanf() return value (smatch warning).
2. Removes a redundant else-if check that could lead to an uninitialized
   variable warning for 'ret' (reported by kernel test robot).

Changes in v3:
- Split the changes into a 2-patch series based on feedback from
Greg Kroah-Hartman.
- Assigned correct Reported-by and Closes tags to both patches. 



abdelnasser hussein (2):
  staging: greybus: audio_codec: fix sscanf return value check
  staging: greybus: audio_codec: remove redundant else-if check

 drivers/staging/greybus/audio_codec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
