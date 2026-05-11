Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLJTG/AdAmocoAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 20:20:32 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F578514445
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 20:20:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 659053F7E4
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 18:20:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	by lists.linaro.org (Postfix) with ESMTPS id A92E83F75A
	for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 12:41:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D5FYDyQd;
	spf=pass (lists.linaro.org: domain of meatuni001@gmail.com designates 209.85.221.44 as permitted sender) smtp.mailfrom=meatuni001@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so3122300f8f.1
        for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778503310; x=1779108110; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=D5FYDyQdU4lj1VGuu3c/63/a+DQiecbMTstpnPXqrbynduoZ7t5/8edHoVnhYltu/o
         35SaX5+MYwoD9/edBu75Mpkc49YXrv0+vd6e4kzyxbqkC9gv5QnO+03/cbdHDPcu5gkI
         7oeLF3hR0lqEH+NhX+DsWoGHPnMVEKMcqZsCUx+a23RVo4GO1e7Y9BrhZT+4/25Nhql+
         x/kpRbNDFHIY5tLFSyAvivBG79V/OgZ6fJBQSv6qLgJx5nSEeFgrNb1JxszdzFqbSPfJ
         YOJwbFczfRccBVDI+fZQaloCll4sH6TiB3T/9Kj+dBL+Lo+5lKZOaGIld0jlelhESh1e
         QKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503310; x=1779108110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=LfjGEp52OKBz3QXktyyJCe/LzD8/MY5rW4CerRNA2CVk/Hk7hzNms3qQoGz8O3z2vH
         OwnvQJI0ZoH76Mlq3IXCZAFT1mRfHMm07U85se6P4YImSRuRd+4KEv43TOiyfYIMWTZx
         nRcKDpADqjXPoDvUG5bqttWwiwHv/6GrWVtamwpulx3DIwiNEpY41YTp5MxfRYYX8cqa
         L6oIWvp1z/RAEJoBRyYDy8WgE35nsCeCItCsCcgSqmdXuLKoFSvOHA6hdGACxDaSkVqW
         a/r8DJ20G0NcNO7alU1ftv9oy5ZzpJIRy4ACGVE+gn5CtfFL+A0I7a9+E4SX6KgVRtBg
         JuQg==
X-Gm-Message-State: AOJu0YzbmNi/gvt9GJZU+/EHkYcLm6S5myNnLt0ztHeTlTrai3NqiNFZ
	COHBoyH5StVmJKs2CIO3RpCHIfIWZc0sRl/MzTVbxHiMoclj7jD451/N
X-Gm-Gg: Acq92OGOvZSjwVXWsZtATttKwjKkDij45R3w/0FVppqoL2R7GpAMMU1M+1fQHdobbgm
	j7o5rlAbu6OBqJSnvUJw7BeT2wqLYY0YJMKq8zL4pCTnunykqFQZ7EUoIyF1r66m6pz38weeLSz
	xVLeoWOu958o7tIhu559993En4ZyCywI00N+dFKofgqXpTkEMlaPNHq8zX1a3ELYMq9FNMITt12
	aQ45ZDMJDc2I2xJX6vjSTI6jrWnueABSnAHFOt7MXnCvH/cEeny22N6b6adOuOhaQZnk8sQ8IDH
	7cLGeQHoJpxyOh4E7aF8kTqDJgGNkXdakeOZoo7HAnXv/yQwayA58QEFCQUuga3PNpiwj/F25FY
	F5/4igvoTE3ejjkLxD9oAmPu5t26k4I3A/ptHuR+v+ahmV3TNZQgA942+7BY+BzzG5QUHa7vFtX
	Nd6a2w1JzBzaXTuSpQ1ZOL9y2//c8As0RNaEFDwQhf3b3JZJSK/CY8W6Hl27MmmBxsEw+3z4yEw
	Kd/bt9Da1XR
X-Received: by 2002:a5d:64e8:0:b0:43b:5672:efe with SMTP id ffacd0b85a97d-4515b056cf3mr39035174f8f.9.1778503309258;
        Mon, 11 May 2026 05:41:49 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm26056634f8f.13.2026.05.11.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:41:49 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 11 May 2026 08:41:30 -0400
Message-ID: <20260511124130.22092-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051156-hamster-plating-7ae7@gregkh>
References: <2026051156-hamster-plating-7ae7@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: meatuni001@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZYGMVA56VW6AQ7DBEWYBNZSLQTC6GLKS
X-Message-ID-Hash: ZYGMVA56VW6AQ7DBEWYBNZSLQTC6GLKS
X-Mailman-Approved-At: Mon, 11 May 2026 18:20:02 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] greybus: authentication: validate CAP response payload size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZYGMVA56VW6AQ7DBEWYBNZSLQTC6GLKS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4F578514445
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meatuni001@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 03:53:00AM +0000, Greg KH wrote:
> Was this tested on any real greybus devices?

No, I do not have access to real Greybus hardware. The issue was
identified through code review of drivers/staging/greybus/authentication.c.

The vulnerable paths are:

1. payload_size is used in a subtraction without first verifying
   payload_size >= sizeof(*response), which can underflow on short
   responses.

2. The resulting size is passed directly to memcpy() into fixed-size
   UAPI buffers without validating against CAP_CERTIFICATE_MAX_SIZE
   or CAP_SIGNATURE_MAX_SIZE.

A malicious or compromised Greybus endpoint could therefore trigger
an out-of-bounds write through an oversized payload.

The fix adds the missing bounds checks before the memcpy() calls,
which matches common kernel validation patterns.

If testing on real hardware is required before merging, I am happy
to wait.

Thanks,
Muhammad Bilal
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
