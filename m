Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP40F49uDWp9xQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 20 May 2026 10:19:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E79FC589929
	for <lists+greybus-dev@lfdr.de>; Wed, 20 May 2026 10:19:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 686424096A
	for <lists+greybus-dev@lfdr.de>; Wed, 20 May 2026 08:19:25 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id 572833F930
	for <greybus-dev@lists.linaro.org>; Wed, 20 May 2026 00:39:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OsUll8dw;
	spf=pass (lists.linaro.org: domain of debjeetbanerjee48@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=debjeetbanerjee48@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bd9c3b550aso28248215ad.2
        for <greybus-dev@lists.linaro.org>; Tue, 19 May 2026 17:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779237547; x=1779842347; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMttTYfVsJwMk/b4c7hquJl42K/4nT9twAXaC1rfgTw=;
        b=OsUll8dwj9Nkh486JOs+y/LXQLnXdRkncDxjVZGF1XUCDpjRlz1gyuG003iGb/S0Ch
         wR4qlf6zhxfjCzlDeXnvNl5PHPn/rt/z/Sk7ZTjH3evzUGjaCiFc5ONtmCtZaYXa4y6P
         3ApicAkI/nrlLveV710dJMsBBtXPsgsT+wijoojJUn1I0wAuBqP5xSQtDeYkNQ45j/6M
         bSPd7Zt0Vnr6tHQrFfQF4/3hKMxjqMz8ki4BSkfl26vLRflSsJT5dLLguVG9KOxjmx+u
         8XEJcJQVb5r4Yhcm5KrsEml7rC7LhUrp5GcaIeQHWQKJJfXNNt6j6dovRta7M8qGNoaU
         4+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779237547; x=1779842347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMttTYfVsJwMk/b4c7hquJl42K/4nT9twAXaC1rfgTw=;
        b=jh8VQntAIqGPEhXjGNfVEE7S02Uigs9+K77oEVliPaE8uZqtSQjqFNa1tBXEOM+tC+
         zY+E15CUUERFoFPJoJ+KaNzMl4Y2x2WPQsc7wCZZFyf2b5L8ix3ByTrixuEvja9YudiW
         fCQFQNl5D60FU3sL2hKfjS1sqHw+sj8/Jk4GlpTAqT31oJcIbQbTJIoa7K3t1awzOmiJ
         Qq3SmwfByCVNK8gFvA3w/N21L6UkvoDxWwH4Y7uo0pfjGGEMwo1UBhOrLtsVOTtFyJBy
         gREJfYTCPhlzpbaTvGvo6YQqVhNinCZ/B7b8WfLeLmG37LxPxSrmO6Lk7UhQorVkLmoJ
         30xQ==
X-Forwarded-Encrypted: i=1; AFNElJ8j5KhwiA1L5z5f71tdxliqnLvqBin7uN4iBWIAApcmG/U4yPIxp7+4W6cEHPOTpswRSFsRWIwGlpuCsA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxKAvwi32bOviI5qPq0F/EoDlDnn5JGt/3SQdks+UscvT9kge+r
	NmXxtDcUv1sY1iV+FGfZC6mwS6snAv4mGdaZQD2khV/vYQZm7SeLVVgy
X-Gm-Gg: Acq92OFUWcJxVNv+1uw1/3MOkil9t+AoFZ+Cw5zWmqdNWpNTeaeaWEBF2S1oVMWOh3L
	jlBsuIA8Uk7tKr8iHOGXZSR0w3uAdBJJMs008vN/iB6/v9UNgsF9h++j9WTKiZxb5dESEIOE7pq
	99xPztoxYID8rLa9kr/DaORvDfm1A+coY8A1kvx5tutIkZBSyYtHZQyZoHTetB4fOEpmnTllObO
	ubqhEUQnaVupJ9pT5QF8qNwkso2wT43VnnGvNoJQEKwrGIDl/S1qvjtDqVQCtZiGC8WhW+vS50j
	2PuSPOZN6BdGd+TCXayHWtgpBnR9HZhjb1SHU05zCGcP3r3RMh+b0m9rsoM8oSMw49t17C1giR2
	ubpHNeLbltMMhbinNcvjn7AjlGZVU+CCBHM8tpt1ZvTWGLIEd6veMppTRghyewZhUVQhYZgUKrH
	7xpID/V1NEkXD7Lorq45/gZke0btIrC7H4X+5d+w9m7A==
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr236662285ad.18.1779237547374;
        Tue, 19 May 2026 17:39:07 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:347:9864:7116:e114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5ef27sm254756255ad.8.2026.05.19.17.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 17:39:07 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 20 May 2026 06:08:46 +0530
Message-ID: <20260520003846.20766-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026050413-smell-ramp-e2a6@gregkh>
References: <2026050413-smell-ramp-e2a6@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: debjeetbanerjee48@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ICLLTTTRVYSQDOIPNGLTE3B3JXD73WUR
X-Message-ID-Hash: ICLLTTTRVYSQDOIPNGLTE3B3JXD73WUR
X-Mailman-Approved-At: Wed, 20 May 2026 08:19:18 +0000
CC: debjeetbanerjee48@gmail.com, dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: uart: clear unsupported c_cflag bits in set_termios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ICLLTTTRVYSQDOIPNGLTE3B3JXD73WUR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E79FC589929
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 4 May 2026 16:15:32 +0200 Greg KH wrote:
> Has this been tested?  If not, I'd prefer to leave this as-is until it
> can be.

Hi Greg,

I don't have the hardware to test this. The change follows the same
pattern used by other uart drivers in the kernel that clear unsupported
c_cflag bits in set_termios, so the logic should be correct, but I
understand your concern.

If you'd prefer to wait for someone with hardware to verify it, that's
fine with me.

Regards,
Debjeet
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
