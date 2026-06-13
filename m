Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yN2FIVXfL2oXIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:41 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB3685A7F
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=sq66ssbX;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 392E540A72
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:17:40 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	by lists.linaro.org (Postfix) with ESMTPS id A9FFD3FDAE
	for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 06:15:17 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9157d3f2098so195936085a.3
        for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2026 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781331317; x=1781936117; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Biw74RXDhRrXl/+hvcvrUJ20txGwKAJRoRdTi99B8aw=;
        b=sq66ssbXBcQIgNNA2gy1rG4T7wZBV4wa2gyMjxh2GRz9v07aEz4gk1O6O9jiltpHQA
         uJpi5uZnzw9em8RIR1i9tbFTwR8u4evSXB0eGD4lt7rP3NxnUwoektnMgvF68zb7nM/+
         tMm3jlEckqQOkgnDxVr1R/RIsTEKlpdq2JV4kgoJIlrFM3Bf6c7KmYQP1irpeOrSu7Ny
         yvWcM0s71EAaUNwz5kaztJ2IECW2HC7+UFcrmRmTKvLo4g3wwYgiDYKXMUwzvWITTtn5
         frJedbQsK0jXVTteWxyiCCyn3rW8ftsqb5uSSv4ibzFRTV7zweeqUntvUS3Auv26sUfp
         Zs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781331317; x=1781936117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Biw74RXDhRrXl/+hvcvrUJ20txGwKAJRoRdTi99B8aw=;
        b=PihHNGpZ/6QsXJBMGAWhiCT3vorG6yxHwE9yRyI0af8DHdAYiXHuOMuV0yDU+k/oiJ
         2KQBvVLnEAoLO6LG8HnpTFWImPxLcM95p7DdZkMgOWP4YIlqM8g0WrmLZD9lqnOKA4Zh
         nJLdyV9h9UPMreS4nANXlAu/cFZO79LqRRlk0RivVk0cmzPngExpYQh61lNWg0S8SSd3
         iHqmwANlaejtecmnPHRobU6vUhH5owTUP2ZmqfUcRExyQS9zCdu2Mnd5gvbyFHDArtNB
         d9S+8R0GzPrP6dGrHuSmszNZrJ18cQtFnq/w68prQPYz/IrD+laoAUSFwlXICe4LlFko
         DIig==
X-Forwarded-Encrypted: i=1; AFNElJ9dgJsK/8FUOWVo2NF4pLaO/WgCEtTTC/4wUN9F8+1Wc4jJpdb7Q6t6rc2PGKWAEq2yY8mPV/OP8f9bcw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzjcYOCF8XYzyMwpuBA+YxM+QiO0Hh/tmAGaCCx4xw3Bav2408w
	UsGaZQz/r/2IhYuSPJDbIqyv996vHuh6GOeYyNkB0Q+qav+m9R7eahKn
X-Gm-Gg: Acq92OE70qtOjo0I08T6L7nPQB9ONXW4M/JurzL2x1058gRIUPHqaXxZXP7GkS+UvJX
	JS4cQ0EAECJrFTHCbjcoXkSYme72XWcr9ZfwEo3+jdFT02V14yUZRCcxI5GhXChWAIHLN9q58Ym
	A3LyRjhpn6eb20DRptZlVFFC+dcIwTDM5IbFM4s5xKugEkKefY3elf2CO6mmqB+9dIn5IAyiol3
	7TlWOeCXKWFv+7ERvWEoz4EIgWep7H0q0TKPuzzlzyJZbGpd+HQKJZ5vd+Kq4PYesDqmjD5vbbJ
	ciBKE90E7WpqfzmRNaqgIBPsO/aD3N3dlE378VAdJXBMM5s8Oh04Sms+o6Nz7V0x+ri4bDq/nLe
	MOhmYf8kZOELZUGPtc2GQ1hPgUozYUBsn24njPAHaIbMnWQqkDNKyehcOpQuinER8tOboL/ud9N
	6cwltMRlqkGrrR094e/aaqljd0qcc=
X-Received: by 2002:a05:620a:1725:b0:916:18b1:ea5d with SMTP id af79cd13be357-9161bf58812mr898215585a.39.1781331317132;
        Fri, 12 Jun 2026 23:15:17 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006426sm417186785a.22.2026.06.12.23.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:15:16 -0700 (PDT)
Date: Sat, 13 Jun 2026 09:15:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brock Haftner <brockhaftner@gmail.com>
Message-ID: <aiz1bMmAN-gQnm9x@stanley.mountain>
References: <20260613014905.48458-1-brockhaftner@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260613014905.48458-1-brockhaftner@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JHYOQZECQSVTUNRAWWPMUZBOGCOKIANG
X-Message-ID-Hash: JHYOQZECQSVTUNRAWWPMUZBOGCOKIANG
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:30 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, outreachy@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: add missing newline to sysfs_emit formats
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JHYOQZECQSVTUNRAWWPMUZBOGCOKIANG/>
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
	DATE_IN_PAST(1.00)[53];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:brockhaftner@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:outreachy@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CDB3685A7F

On Fri, Jun 12, 2026 at 06:49:05PM -0700, Brock Haftner wrote:
> The sysfs_emit() function is used to format strings that are returned
> to userspace. According to the sysfs documentation, these outputs
> should include a newline character for visual clarity.
> 
> Fix the checkpatch.pl warnings by adding the missing '\n' to the
> sysfs_emit() format strings inside several functions.
> 
> Signed-off-by: Brock Haftner <brockhaftner@gmail.com>

Please don't do this for existing code, only for new code.  There
is a risck that user space relies on the old behavior.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
