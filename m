Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1CpzEFnfL2oYIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:45 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA1685A82
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=HCPc1YBF;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32B9640A7B
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:17:44 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	by lists.linaro.org (Postfix) with ESMTPS id D50B73F8F1
	for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 06:17:12 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ccef25789fso12871916d6.3
        for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2026 23:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781331432; x=1781936232; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1p3BAGZnV1gRRVE0W3J1YkAbfp6JIr+wulrSf/UbmkE=;
        b=HCPc1YBF6Sg6aG7FHne0JP2e//BaUx1BGDUos8u4WmXBM5/+mBRqgQXZ01OrZdGp+Q
         qdniEq6HsvjDJjEEkrLdv1qBKRy+yP21bdwSw6dRyPmrSNrIKXvzNIZLe8gFWVChEPab
         bJENOTiob1ZiHpqEeJJorKodEbY33ulW3r5xdvwQtOhPCz5lGSnnnfGR6sm4OPFzlJy5
         bUx41Cgm6tF8rnyG/MlE08mytCqf8WOMWe69PGtYWvx3l6Owgs/13AcoHv1dJ94czAqr
         5iYGf+LSrpAQAZZkkharFihnQhH8QcHiQvl7IwMxua47eqrumvlEasgwAbGI87q+cwc9
         NEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781331432; x=1781936232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1p3BAGZnV1gRRVE0W3J1YkAbfp6JIr+wulrSf/UbmkE=;
        b=JuXUAEWkhGsr2SOpQLhKIJypaBgzE8fI8ljHd8xyZbXdkcYah0PK7LqHTGIgfd6fEM
         ft6aQYwAzsinAkKIei5rUk0J9gqcUtrY1P4gHsjoa1HkO8F4OV9e6r46qsuB7irZCCQY
         CY/6xSTMbGqkclw0pqa7JeE57ouisiGyHTea96HTGwkZusxodwBSYDgI6NP4mjGqGna2
         sgE/HY6M3A/d4dz+thFaeSbaFUHnHjcXDlK8QRfayt6TCObkTJUac8xTIs1VZIjl9KOC
         XiIvfm0H1s6dfZZcBJPHIPFljKbGuE/UpOp3oAiTLqaHGnvL1vsvVMx6UdOoYRtCsm4M
         giqg==
X-Forwarded-Encrypted: i=1; AFNElJ8ihOKtru+Ie5XXswYGaBT8uQkTSgO30Fr9GaNRm3wJIsPv+/3jUcZpZ5tz4OTKg8e2zmAWQuKKFspfuA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxANJpnWddgiqBlBOBKmyslfa1tspwK5m0r8oBsoRaBeMs7SG8j
	QGD2jI8Ao6LlkMw/ugrhautL8esbiglgPvqNt4ZIsKx+FW5mPOee7fP+
X-Gm-Gg: Acq92OECYjpY+8yLURoZc9LuqNSdJ4X114TA7SQqiC9L/koa2UfpTGatwcY8fT+1rTB
	NtNmZVbUekBiij4fHyqtR1Ry7TUAcc4/Jh0L/LPzDpYTleYI5F2ntL8BNBXIqRiAu2Lq8qO77Oa
	O/g4HjnRfNdH12lDSlkVbIu8IF6t+3uzmZEjvtbZ08Tvf2M3VXns4PJhec8tlaaUbRv0ALonfeb
	EgCzt0R4OQltMsyK+lWxQClxVaShEd2HkcZKeMRd6htYlwBfiej8Ovq7ZZakO6HNClp8z/QMmNA
	3D6+YmUCRVjFyVBJ33wm4wmZtyUdERRxHmEZp9XDC+NgeJY8b5J4JMPKaR7H5kfLYKnvYK5OWur
	+ZsgFjYKlUuiX0FqmMoTP/tfI140uUuQJzOhoDk286ZaceRZAi0fRXgqzfYHX4CpNwZGCIwuuOk
	g3ZkJV74eaczplFEVc
X-Received: by 2002:a05:6214:d83:b0:8cc:ebc0:6ec7 with SMTP id 6a1803df08f44-8d32ebcf12bmr100315286d6.38.1781331432342;
        Fri, 12 Jun 2026 23:17:12 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d305134b20sm43615736d6.43.2026.06.12.23.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:17:11 -0700 (PDT)
Date: Sat, 13 Jun 2026 09:17:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brock Haftner <brockhaftner@gmail.com>
Message-ID: <aiz14CLCduz7996E@stanley.mountain>
References: <20260613014905.48458-1-brockhaftner@gmail.com>
 <aiz1bMmAN-gQnm9x@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aiz1bMmAN-gQnm9x@stanley.mountain>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UFXL56UKENAGTX47MCEVQAJR432DFWE4
X-Message-ID-Hash: UFXL56UKENAGTX47MCEVQAJR432DFWE4
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:30 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, outreachy@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: add missing newline to sysfs_emit formats
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UFXL56UKENAGTX47MCEVQAJR432DFWE4/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1ADA1685A82

On Sat, Jun 13, 2026 at 09:15:08AM +0300, Dan Carpenter wrote:
> On Fri, Jun 12, 2026 at 06:49:05PM -0700, Brock Haftner wrote:
> > The sysfs_emit() function is used to format strings that are returned
> > to userspace. According to the sysfs documentation, these outputs
> > should include a newline character for visual clarity.
> > 
> > Fix the checkpatch.pl warnings by adding the missing '\n' to the
> > sysfs_emit() format strings inside several functions.
> > 
> > Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
> 
> Please don't do this for existing code, only for new code.  There
> is a risck that user space relies on the old behavior.

We should delete this checkpatch warning really.  It could be a
sashiko rule which only applies for patches which introduce new
functions or something.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
